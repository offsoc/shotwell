/* Copyright 2012 BJA Electronics
 * Copyright 2017 Jens Georg
 * Author: Jeroen Arnoldus (b.j.arnoldus@bja-electronics.nl)
 * Author: Jens Georg <mail@jensge.org>
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */

using Shotwell.Plugins;

namespace Publishing.Authenticator.Shotwell.Tumblr {
    internal const string ENDPOINT_URL = "https://www.tumblr.com/";
    internal const string API_KEY = "NdXvXQuKVccOsCOj0H4k9HUJcbcjDBYSo2AkaHzXFECHGNuP9k";
    internal const string API_SECRET = "BN0Uoig0MwbeD27OgA0IwYlp3Uvonyfsrl9pf1cnnMj1QoEUvi";
    internal const string SERVICE_WELCOME_MESSAGE = _("You are not currently logged into Tumblr.\n\nClick Log in to log into Tublr in your Web browser. You will have to authorize Shotwell Connect to link to your Tumblr account.");

    internal class AuthenticationRequestTransaction : Publishing.RESTSupport.OAuth1.Transaction {
        public AuthenticationRequestTransaction(Publishing.RESTSupport.OAuth1.Session session, string cookie) {
            base.with_uri(session, "https://www.tumblr.com/oauth/request_token",
                    Publishing.RESTSupport.HttpMethod.POST);
            add_argument("oauth_callback", "shotwell-oauth2://localhost?sw_auth_cookie=%s".printf(cookie));
        }
    }

    internal class AccessTokenFetchTransaction : Publishing.RESTSupport.OAuth1.Transaction {
        public AccessTokenFetchTransaction(Publishing.RESTSupport.OAuth1.Session session, string user_verifier, string cookie) {
            base.with_uri(session, "https://www.tumblr.com/oauth/access_token",
                    Publishing.RESTSupport.HttpMethod.POST);
                    add_argument("oauth_verifier", user_verifier);
                    add_argument("oauth_token", session.get_request_phase_token());
                    add_argument("oauth_callback", "shotwell-oauth2://localhost?sw_auth_cookie=%s".printf(cookie));
        }
    }

    internal class Tumblr : Publishing.Authenticator.Shotwell.OAuth1.Authenticator {
        private string auth_cookie = Uuid.string_random();

        public Tumblr(Spit.Publishing.PluginHost host) {
            base("Tumblr", API_KEY, API_SECRET, host);
        }

        public override void authenticate() {
            if (is_persistent_session_valid()) {
                debug("attempt start: a persistent session is available; using it");

                session.authenticate_from_persistent_credentials(get_persistent_access_phase_token(),
                        get_persistent_access_phase_token_secret(), "unused");
            } else {
                debug("attempt start: no persistent session available; showing login welcome pane");

                do_show_authentication_pane();
            }
        }

        public override bool can_logout() {
            return true;
        }

        public override void logout() {
            this.session.deauthenticate();
            invalidate_persistent_session();
        }

        public override void refresh() {
            // No-op with Tumblr
        }

        /**
         * Action that shows the authentication pane.
         *
         * This action method shows the authentication pane. It is shown at the
         * very beginning of the interaction when no persistent parameters are found
         * or after a failed login attempt using persisted parameters. It can be
         * given a mode flag to specify whether it should be displayed in initial
         * mode or in any of the error modes that it supports.
         *
         * @param mode the mode for the authentication pane
         */
        private void do_show_authentication_pane() {
            debug("ACTION: installing authentication pane");

            host.set_service_locked(false);
            host.install_welcome_pane("%s".printf(SERVICE_WELCOME_MESSAGE), on_welcome_pane_login_clicked);
        }

        private void on_welcome_pane_login_clicked() {
            debug("EVENT: user clicked 'Login' button in the welcome pane");

            do_run_authentication_request_transaction.begin();
        }

        private async void do_run_authentication_request_transaction() {
            debug("ACTION: running authentication request transaction");

            host.set_service_locked(true);
            host.install_static_message_pane(_("Preparing for login…"));

            AuthenticationRequestTransaction txn = new AuthenticationRequestTransaction(session, auth_cookie);
            try {
                yield txn.execute_async();
                debug("EVENT: OAuth authentication request transaction completed; response = '%s'",
                    txn.get_response());
                do_parse_token_info_from_auth_request(txn.get_response());
            } catch (Error err) {
                debug("EVENT: OAuth authentication request transaction caused a network error");
                host.post_error(err);

                this.authentication_failed();
            }
        }

        private void do_parse_token_info_from_auth_request(string response) {
            debug("ACTION: parsing authorization request response '%s' into token and secret", response);

            string? oauth_token = null;
            string? oauth_token_secret = null;

            var data = Soup.Form.decode(response);
            data.lookup_extended("oauth_token", null, out oauth_token);
            data.lookup_extended("oauth_token_secret", null, out oauth_token_secret);

            if (oauth_token == null || oauth_token_secret == null)
                host.post_error(new Spit.Publishing.PublishingError.MALFORMED_RESPONSE(
                            "'%s' isn't a valid response to an OAuth authentication request", response));


            on_authentication_token_available(oauth_token, oauth_token_secret);
        }

        private void on_authentication_token_available(string token, string token_secret) {
            debug("EVENT: OAuth authentication token (%s) and token secret (%s) available",
                    token, token_secret);

            session.set_request_phase_credentials(token, token_secret);

            do_web_authentication.begin(token);
        }
        private class AuthCallback : Spit.Publishing.AuthenticatedCallback, Object {
            public signal void auth(GLib.HashTable<string, string> params);

            public void authenticated(GLib.HashTable<string, string> params) {
                auth(params);
            }
        }

        private async void do_web_authentication(string token) {
            var uri = "https://www.tumblr.com/oauth/authorize?oauth_token=%s&perms=write".printf(token);
            var pane = new Common.ExternalWebPane(uri);
            host.install_dialog_pane(pane);
            var auth_callback = new AuthCallback();
            string? web_auth_code = null;
            auth_callback.auth.connect((prm) => {
                if ("oauth_verifier" in prm) {
                    web_auth_code = prm["oauth_verifier"];
                }
                do_web_authentication.callback();
            });
            host.register_auth_callback(auth_cookie, auth_callback);
            yield;
            host.unregister_auth_callback(auth_cookie);
            yield do_verify_pin(web_auth_code);
        }

        private async void do_verify_pin(string pin) {
            debug("ACTION: validating authorization PIN %s", pin);

            host.set_service_locked(true);
            host.install_static_message_pane(_("Verifying authorization…"));

            AccessTokenFetchTransaction txn = new AccessTokenFetchTransaction(session, pin, auth_cookie);

            try {
                yield txn.execute_async();
                debug("EVENT: fetching OAuth access token over the network succeeded");

                do_extract_access_phase_credentials_from_response(txn.get_response());
            } catch (Error err) {
                debug("EVENT: fetching OAuth access token over the network caused an error.");

                host.post_error(err);
                this.authentication_failed();
            }
        }

        private void do_extract_access_phase_credentials_from_response(string response) {
            debug("ACTION: extracting access phase credentials from '%s'", response);

            string? token = null;
            string? token_secret = null;
            string? username = "unused";

            var data = Soup.Form.decode(response);
            data.lookup_extended("oauth_token", null, out token);
            data.lookup_extended("oauth_token_secret", null, out token_secret);

            debug("access phase credentials: { token = '%s'; token_secret = '%s'; username = '%s' }",
                    token, token_secret, username);

            if (token == null || token_secret == null || username == null) {
                host.post_error(new Spit.Publishing.PublishingError.MALFORMED_RESPONSE("expected " +
                            "access phase credentials to contain token, token secret, and username but at " +
                            "least one of these is absent"));
                this.authentication_failed();
            } else {
                session.set_access_phase_credentials(token, token_secret, username);
            }
        }

    }
}
