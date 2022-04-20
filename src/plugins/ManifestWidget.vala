/* Copyright 2016 Software Freedom Conservancy Inc.
 *
 * This software is licensed under the GNU Lesser General Public License
 * (version 2.1 or later).  See the COPYING file in this distribution.
 */

namespace Plugins {


[GtkTemplate (ui = "/org/gnome/Shotwell/ui/manifest_widget.ui")]
public class ManifestWidgetMediator : Gtk.Box {
    [GtkChild]
    private unowned Gtk.Button about_button;
    
    [GtkChild]
    private unowned Gtk.ScrolledWindow list_bin;
    
    private ManifestListView list = new ManifestListView();
    
    public ManifestWidgetMediator() {
        Object();

        list_bin.set_child(list);
        
        about_button.clicked.connect(on_about);
        list.get_selection().changed.connect(on_selection_changed);
        
        set_about_button_sensitivity();
    }
    
    private void on_about() {
        string[] ids = list.get_selected_ids();
        if (ids.length == 0)
            return;
        
        string id = ids[0];
        
        Spit.PluggableInfo info = Spit.PluggableInfo();
        if (!get_pluggable_info(id, ref info)) {
            warning("Unable to retrieve information for plugin %s", id);
            
            return;
        }
        
        // prepare authors names (which are comma-delimited by the plugin) for the about box
        // (which wants an array of names)
        string[]? authors = null;
        if (info.authors != null) {
            string[] split = info.authors.split(",");
            for (int ctr = 0; ctr < split.length; ctr++) {
                string stripped = split[ctr].strip();
                if (!is_string_empty(stripped)) {
                    if (authors == null)
                        authors = new string[0];
                    
                    authors += stripped;
                }
            }
        }
        
        Gtk.AboutDialog about_dialog = new Gtk.AboutDialog();
        about_dialog.authors = authors;
        about_dialog.comments = info.brief_description;
        about_dialog.copyright = info.copyright;
        about_dialog.license = info.license;
        about_dialog.wrap_license = info.is_license_wordwrapped;
        #if 0
        about_dialog.logo = (info.icons != null && info.icons.length > 0) ? info.icons[0] :
            Resources.get_icon(Resources.ICON_GENERIC_PLUGIN);
            #endif
        about_dialog.program_name = get_pluggable_name(id);
        about_dialog.translator_credits = info.translators;
        about_dialog.version = info.version;
        about_dialog.website = info.website_url;
        about_dialog.website_label = info.website_name;
        about_dialog.set_modal (true);
        
        // TODO about_dialog.run();
        Gtk.show_about_dialog(about_dialog);
    }
    
    private void on_selection_changed() {
        set_about_button_sensitivity();
    }
    
    private void set_about_button_sensitivity() {
        // have to get the array and then get its length rather than do so in one call due to a 
        // bug in Vala 0.10:
        //     list.get_selected_ids().length -> uninitialized value
        // this appears to be fixed in Vala 0.11
        string[] ids = list.get_selected_ids();
        about_button.sensitive = (ids.length == 1);
    }
}

private class ManifestListView : Gtk.TreeView {
    private const int ICON_SIZE = 24;
    private const int ICON_X_PADDING = 6;
    private const int ICON_Y_PADDING = 2;
    
    private enum Column {
        ENABLED,
        CAN_ENABLE,
        ICON,
        NAME,
        ID,
        N_COLUMNS
    }
    
    private Gtk.TreeStore store = new Gtk.TreeStore(Column.N_COLUMNS,
        typeof(bool),       // ENABLED
        typeof(bool),       // CAN_ENABLE
        typeof(Gdk.Paintable), // ICON
        typeof(string),     // NAME
        typeof(string)      // ID
    );
    
    public ManifestListView() {
        set_model(store);
        
        Gtk.CellRendererToggle checkbox_renderer = new Gtk.CellRendererToggle();
        checkbox_renderer.radio = false;
        checkbox_renderer.activatable = true;
        
        Gtk.CellRendererPixbuf icon_renderer = new Gtk.CellRendererPixbuf();
        icon_renderer.xpad = ICON_X_PADDING;
        icon_renderer.ypad = ICON_Y_PADDING;
        
        Gtk.CellRendererText text_renderer = new Gtk.CellRendererText();
        
        Gtk.TreeViewColumn column = new Gtk.TreeViewColumn();
        column.set_sizing(Gtk.TreeViewColumnSizing.AUTOSIZE);
        column.pack_start(checkbox_renderer, false);
        column.pack_start(icon_renderer, false);
        column.pack_end(text_renderer, true);
        
        column.add_attribute(checkbox_renderer, "active", Column.ENABLED);
        column.add_attribute(checkbox_renderer, "visible", Column.CAN_ENABLE);
        column.add_attribute(icon_renderer, "pixbuf", Column.ICON);
        column.add_attribute(text_renderer, "text", Column.NAME);
        
        append_column(column);
        
        set_headers_visible(false);
        set_enable_search(false);
        set_show_expanders(true);
        set_reorderable(false);
        set_enable_tree_lines(false);
        set_grid_lines(Gtk.TreeViewGridLines.NONE);
        get_selection().set_mode(Gtk.SelectionMode.BROWSE);
        
        Gtk.IconTheme icon_theme = Gtk.IconTheme.get_for_display (Gdk.Display.get_default());
        
        // create a list of plugins (sorted by name) that are separated by extension points (sorted
        // by name)
        foreach (ExtensionPoint extension_point in get_extension_points(compare_extension_point_names)) {
            Gtk.TreeIter category_iter;
            store.append(out category_iter, null);
            
            Gdk.Paintable? icon = null;
            if (extension_point.icon_name != null) {
                icon = icon_theme.lookup_by_gicon(
                    new ThemedIcon(extension_point.icon_name), ICON_SIZE, 1, Gtk.TextDirection.NONE, 0);
            }
            
            store.set(category_iter, Column.NAME, extension_point.name, Column.CAN_ENABLE, false,
                Column.ICON, icon);
            
            Gee.Collection<Spit.Pluggable> pluggables = get_pluggables_for_type(
                extension_point.pluggable_type, compare_pluggable_names, true);
            foreach (Spit.Pluggable pluggable in pluggables) {
                bool enabled;
                if (!get_pluggable_enabled(pluggable.get_id(), out enabled))
                    continue;
                
                Spit.PluggableInfo info = Spit.PluggableInfo();
                pluggable.get_info(ref info);
                                
                Gtk.TreeIter plugin_iter;
                store.append(out plugin_iter, category_iter);
                
                store.set(plugin_iter, Column.ENABLED, enabled, Column.NAME, pluggable.get_pluggable_name(),
                    Column.ID, pluggable.get_id(), Column.CAN_ENABLE, true, Column.ICON, icon);
            }
        }
        
        expand_all();
    }
    
    public string[] get_selected_ids() {
        string[] ids = new string[0];
        
        List<Gtk.TreePath> selected = get_selection().get_selected_rows(null);
        foreach (Gtk.TreePath path in selected) {
            Gtk.TreeIter iter;
            string? id = get_id_at_path(path, out iter);
            if (id != null)
                ids += id;
        }
        
        return ids;
    }
    
    private string? get_id_at_path(Gtk.TreePath path, out Gtk.TreeIter iter) {
        if (!store.get_iter(out iter, path))
            return null;
        
        unowned string id;
        store.get(iter, Column.ID, out id);
        
        return id;
    }
}

}

