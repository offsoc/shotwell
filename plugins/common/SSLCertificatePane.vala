// SPDX-License-Identifer: LGPL-2.1-or-later
// SPDX-FileCopyrightText: 2022 Jens Georg <mail@jensge.org>

using Shotwell;
using Shotwell.Plugins;

private class GcrDetailsDialog : Gtk.Window {
    public GcrDetailsDialog(Gtk.Window? parent, Gcr.Certificate certificate) {
        Object(parent: parent, transient_for: parent, modal: true);

        set_default_size(300, -1);
        set_resizable(true);

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 6);
        var scrolled = new Gtk.ScrolledWindow();
        scrolled.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC);
        scrolled.set_child(box);
        set_child(scrolled);
        var primary = new Gtk.Box(Gtk.Orientation.VERTICAL, 6);
        var secondary = new Gtk.Box(Gtk.Orientation.VERTICAL, 6);
        box.append(primary);
        box.append(secondary);

        foreach (var section in certificate.get_interface_elements()) {
            var label = new Gtk.Label (section.get_label());
            label.add_css_class("heading");
            var section_box = new Gtk.ListBox();
            section_box.margin_start = 16;
            section_box.margin_end = 16;
            section_box.set_selection_mode(Gtk.SelectionMode.NONE);
            section_box.add_css_class("boxed-list");
            var size_group = new Gtk.SizeGroup(Gtk.SizeGroupMode.HORIZONTAL);
            section_box.bind_model(section.get_fields(), (field) => {
                return create_detail_row((Gcr.CertificateField) field, size_group);
            });
            if (Gcr.CertificateSectionFlags.IMPORTANT in section.get_flags()) {
                primary.append(label);
                primary.append(section_box);    
            } else {
                secondary.append(label);
                secondary.append(section_box);    
            }
        }
    }
     string hexdump (uint8[] data) {
        var builder = new StringBuilder.sized (16);
        var i = 0;

        foreach (var c in data) {
            if (i % 16 == 0 && i != 0) {
                builder.append_c('\n');
            }
            i++;
            builder.append_printf ("%02x ", c);
        }

        return builder.str;
    }

    private Gtk.Widget create_detail_row (Gcr.CertificateField field, Gtk.SizeGroup size_group) {
        var row = new Gtk.ListBoxRow();
        var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 6);
        box.margin_top = 12;
        box.margin_bottom = 12;
        box.margin_start = 12;
        box.margin_end = 12;
        var label = new Gtk.Label(field.get_label());
        label.xalign = 0.0f;
        label.yalign = 0.0f;
        box.prepend(label);
        row.set_child(box);

        var type = field.get_value_type();
        var value = field.value;

        if (value.holds(typeof(string))) {
            label = new Gtk.Label(value.get_string());
            label.xalign = 1.0f;
            label.hexpand = true;
            box.append(label);
        }
        if (type.is_a(typeof(string[]))) {
            var strs = (string[]) value.get_boxed();
            label = new Gtk.Label(string.joinv("\n", strs));
            label.xalign = 1.0f;
            label.hexpand = true;
            box.append(label);
        }
        if (type.is_a(typeof(Bytes))) {
            var bytes = (Bytes)value.get_boxed();
            label = new Gtk.Label(hexdump(bytes.get_data()));
            label.xalign = 1.0f;
            label.yalign = 0.0f;
            label.hexpand = true;
            box.append(label);
            label.add_css_class("monospace");
        }

        size_group.add_widget(row);
        return row;
    }
}

public class Shotwell.Plugins.Common.SslCertificatePane : Common.BuilderPane {

    public signal void proceed ();
    public string host { owned get; construct; }
    public TlsCertificate? cert { get; construct; }
    public string error_text { owned get; construct; }

    public SslCertificatePane (Publishing.RESTSupport.Transaction transaction,
                         string host) {
        TlsCertificate cert;
        var text = transaction.detailed_error_from_tls_flags (out cert);
        Object (resource_path : Resources.RESOURCE_PATH +
                                "/ssl_certificate_pane.ui",
                default_id: "default",
                cert : cert,
                error_text : text,
                host : host);
    }

    public override void constructed () {
        base.constructed ();

        var label = this.get_builder ().get_object ("main_text") as Gtk.Label;
        var bold_host = "<b>%s</b>".printf(host);
        // %s is the host name that we tried to connect to
        label.set_text (_("This does not look like the real %s. Attackers might be trying to steal or alter information going to or from this site (for example, private messages, credit card information, or passwords).").printf(bold_host));
        label.use_markup = true;

        label = this.get_builder ().get_object ("ssl_errors") as Gtk.Label;
        label.set_text (error_text);

        var info = this.get_builder ().get_object ("default") as Gtk.Button;
        if (cert != null) {
            info.clicked.connect (() => {
                var simple_cert = new Gcr.SimpleCertificate (cert.certificate.data);
                var widget = new GcrDetailsDialog(null, simple_cert);
                widget.show();
            #if 0
                var widget = new Gcr.CertificateWidget (simple_cert);
                bool use_header = true;
                Gtk.Settings.get_default ().get ("gtk-dialogs-use-header", out use_header);
                var flags = (Gtk.DialogFlags) 0;
                if (use_header) {
                    flags |= Gtk.DialogFlags.USE_HEADER_BAR;
                }

                var dialog = new Gtk.Dialog.with_buttons (
                                _("Certificate of %s").printf (host),
                                null,
                                flags,
                                _("_OK"), Gtk.ResponseType.OK);
                dialog.get_content_area ().add (widget);
                dialog.set_default_response (Gtk.ResponseType.OK);
                dialog.set_default_size (640, -1);
                dialog.show_all ();
                dialog.run ();
                dialog.destroy ();
                #endif
            });
        } else {
            info.unparent();
        }

        var proceed = this.get_builder ().get_object ("proceed_button") as Gtk.Button;
        proceed.clicked.connect (() => { this.proceed (); });
    }
}
