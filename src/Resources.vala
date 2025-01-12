/* Copyright 2009-2013 Yorba Foundation
 *
 * This software is licensed under the GNU LGPL (version 2.1 or later).
 * See the COPYING file in this distribution.
 */

// defined by ./configure or Makefile and included by gcc -D
extern const string _PREFIX;
extern const string _VERSION;
extern const string GETTEXT_PACKAGE;
extern const string _LIB;
extern const string? _GIT_VERSION;

namespace Resources {
    public const string APP_TITLE = "Shotwell";
    public const string APP_LIBRARY_ROLE = _("Photo Manager");
    public const string APP_DIRECT_ROLE = _("Photo Viewer");
    public const string APP_VERSION = _VERSION;

#if _GITVERSION
    public const string? GIT_VERSION = _GIT_VERSION;
#else
    public const string? GIT_VERSION = null;
#endif

    public const string COPYRIGHT = _("Copyright 2009-2013 Yorba Foundation");
    public const string APP_GETTEXT_PACKAGE = GETTEXT_PACKAGE;
    
    public const string YORBA_URL = "http://www.yorba.org";
    public const string WIKI_URL = "http://redmine.yorba.org/projects/shotwell/wiki/Shotwell";
    public const string FAQ_URL = "http://redmine.yorba.org/projects/shotwell/wiki/ShotwellFAQ";
    public const string BUG_DB_URL = "http://redmine.yorba.org/projects/shotwell/issues/new";
    public const string DIR_PATTERN_URI_SYSWIDE = "ghelp:shotwell?other-files";

    private const string LIB = _LIB;

    public const string PREFIX = _PREFIX;

    public const double TRANSIENT_WINDOW_OPACITY = 0.90;
    
    public const int DEFAULT_ICON_SCALE = 24;
   
    public const string[] AUTHORS = { 
        "Jim Nelson <jim@yorba.org>", 
        "Lucas Beeler <lucas@yorba.org>",
        "Allison Barlow <allison@yorba.org>",
        "Eric Gregory <eric@yorba.org>",
        "Clinton Rogers <clinton@yorba.org>",
        null
    };

    public const string LICENSE = """
Shotwell is free software; you can redistribute it and/or modify it under the 
terms of the GNU Lesser General Public License as published by the Free 
Software Foundation; either version 2.1 of the License, or (at your option) 
any later version.

Shotwell is distributed in the hope that it will be useful, but WITHOUT 
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for 
more details.

You should have received a copy of the GNU Lesser General Public License 
along with Shotwell; if not, write to the Free Software Foundation, Inc., 
51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
""";

    public const string CLOCKWISE = "object-rotate-right";
    public const string COUNTERCLOCKWISE = "object-rotate-left";
    public const string HFLIP = "object-flip-horizontal";
    public const string VFLIP = "object-flip-vertical";
    public const string CROP = "shotwell-crop";
    public const string STRAIGHTEN = "shotwell-straighten";
    public const string REDEYE = "shotwell-redeye";
    public const string ADJUST = "shotwell-adjust";
    public const string PIN_TOOLBAR = "shotwell-pin-toolbar";
    public const string MAKE_PRIMARY = "shotwell-make-primary";
    public const string IMPORT = "shotwell-import";
    public const string IMPORT_ALL = "shotwell-import-all";
    public const string ENHANCE = "shotwell-auto-enhance";
    public const string CROP_PIVOT_RETICLE = "shotwell-crop-pivot-reticle";
    public const string PUBLISH = "applications-internet";
    public const string MERGE = "shotwell-merge-events";

    public const string ICON_APP = "shotwell.svg";
    public const string ICON_APP16 = "shotwell-16.svg";
    public const string ICON_APP24 = "shotwell-24.svg";
    
    public const string APP_ICONS[] = { ICON_APP, ICON_APP16, ICON_APP24 };
    
    public const string ICON_ABOUT_LOGO = "shotwell-street.jpg";
    public const string ICON_GENERIC_PLUGIN = "generic-plugin.png";
    public const string ICON_SLIDESHOW_EXTENSION_POINT = "slideshow-extension-point";
    public const string ICON_RATING_REJECTED = "rejected.svg";
    public const string ICON_RATING_ONE = "one-star.svg";
    public const string ICON_RATING_TWO = "two-stars.svg";
    public const string ICON_RATING_THREE = "three-stars.svg";
    public const string ICON_RATING_FOUR = "four-stars.svg";
    public const string ICON_RATING_FIVE = "five-stars.svg";
    public const string ICON_FILTER_REJECTED_OR_BETTER = "all-rejected.png";
    public const int ICON_FILTER_REJECTED_OR_BETTER_FIXED_SIZE = 32;
    public const string ICON_FILTER_UNRATED_OR_BETTER = "shotwell-16.svg";
    public const int ICON_FILTER_UNRATED_OR_BETTER_FIXED_SIZE = 16;
    public const string ICON_FILTER_ONE_OR_BETTER = "one-star-filter-plus.svg";
    public const string ICON_FILTER_TWO_OR_BETTER = "two-star-filter-plus.svg";
    public const string ICON_FILTER_THREE_OR_BETTER = "three-star-filter-plus.svg";
    public const string ICON_FILTER_FOUR_OR_BETTER = "four-star-filter-plus.svg";
    public const string ICON_FILTER_FIVE = "five-star-filter.svg";
    public const string ICON_ZOOM_IN = "zoom-in.png";
    public const string ICON_ZOOM_OUT = "zoom-out.png";
    public const int ICON_ZOOM_SCALE = 16;

    public const string ICON_CAMERAS = "camera-photo";
    public const string ICON_EVENTS = "multiple-events";
    public const string ICON_ONE_EVENT = "one-event";
    public const string ICON_ONE_TAG = "one-tag";
    public const string ICON_TAGS = "multiple-tags";
    public const string ICON_FOLDER_CLOSED = "folder";
    public const string ICON_FOLDER_OPEN = "folder-open";
    public const string ICON_FOLDER_DOCUMENTS = "folder-documents";
    public const string ICON_IMPORTING = "go-down";
    public const string ICON_LAST_IMPORT = "document-open-recent";
    public const string ICON_MISSING_FILES = "process-stop";
    public const string ICON_PHOTOS = "shotwell-16";
    public const string ICON_SINGLE_PHOTO = "image-x-generic";
    public const string ICON_FILTER_PHOTOS = "filter-photos";
    public const string ICON_FILTER_PHOTOS_DISABLED = "filter-photos-disabled";
    public const string ICON_FILTER_VIDEOS = "filter-videos";
    public const string ICON_FILTER_VIDEOS_DISABLED = "filter-videos-disabled";
    public const string ICON_FILTER_RAW = "filter-raw";
    public const string ICON_FILTER_RAW_DISABLED = "filter-raw-disabled";
    public const string ICON_FILTER_FLAGGED = "filter-flagged";
    public const string ICON_FILTER_FLAGGED_DISABLED = "filter-flagged-disabled";
    public const string ICON_TRASH_EMPTY = "user-trash";
    public const string ICON_TRASH_FULL = "user-trash-full";
    public const string ICON_VIDEOS_PAGE = "videos-page";
    public const string ICON_FLAGGED_PAGE = "flag-page";
    public const string ICON_FLAGGED_TRINKET = "flag-trinket.png";

    public const string ROTATE_CW_MENU = _("Rotate _Right");
    public const string ROTATE_CW_LABEL = _("Rotate");
    public const string ROTATE_CW_FULL_LABEL = _("Rotate Right");
    public const string ROTATE_CW_TOOLTIP = _("Rotate the photos right (press Ctrl to rotate left)");
    
    public const string ROTATE_CCW_MENU = _("Rotate _Left");
    public const string ROTATE_CCW_LABEL = _("Rotate");
    public const string ROTATE_CCW_FULL_LABEL = _("Rotate Left");
    public const string ROTATE_CCW_TOOLTIP = _("Rotate the photos left");
    
    public const string HFLIP_MENU = _("Flip Hori_zontally");
    public const string HFLIP_LABEL = _("Flip Horizontally");
    
    public const string VFLIP_MENU = _("Flip Verti_cally");
    public const string VFLIP_LABEL = _("Flip Vertically");
    
    public const string ENHANCE_MENU = _("_Enhance");
    public const string ENHANCE_LABEL = _("Enhance");
    public const string ENHANCE_TOOLTIP = _("Automatically improve the photo's appearance");
    
    public const string CROP_MENU = _("_Crop");
    public const string CROP_LABEL = _("Crop");
    public const string CROP_TOOLTIP = _("Crop the photo's size");

    public const string STRAIGHTEN_MENU = _("_Straighten");
    public const string STRAIGHTEN_LABEL = _("Straighten");    
    public const string STRAIGHTEN_TOOLTIP = _("Straighten the photo");    
    
    public const string RED_EYE_MENU = _("_Red-eye");
    public const string RED_EYE_LABEL = _("Red-eye");
    public const string RED_EYE_TOOLTIP = _("Reduce or eliminate any red-eye effects in the photo");
    
    public const string ADJUST_MENU = _("_Adjust");
    public const string ADJUST_LABEL = _("Adjust");
    public const string ADJUST_TOOLTIP = _("Adjust the photo's color and tone");
    
    public const string REVERT_MENU = _("Re_vert to Original");
    public const string REVERT_LABEL = _("Revert to Original");
    
    public const string REVERT_EDITABLE_MENU = _("Revert External E_dits");
    public const string REVERT_EDITABLE_TOOLTIP = _("Revert to the master photo");
    
    public const string SET_BACKGROUND_MENU = _("Set as _Desktop Background");
    public const string SET_BACKGROUND_TOOLTIP = _("Set selected image to be the new desktop background");
    public const string SET_BACKGROUND_SLIDESHOW_MENU = _("Set as _Desktop Slideshow...");
    
    public const string UNDO_MENU = _("_Undo");
    public const string UNDO_LABEL = _("Undo");
    
    public const string REDO_MENU = _("_Redo");
    public const string REDO_LABEL = _("Redo");
    
    public const string RENAME_EVENT_MENU = _("Re_name Event...");
    public const string RENAME_EVENT_LABEL = _("Rename Event");
    
    public const string MAKE_KEY_PHOTO_MENU = _("Make _Key Photo for Event");
    public const string MAKE_KEY_PHOTO_LABEL = _("Make Key Photo for Event");
    
    public const string NEW_EVENT_MENU = _("_New Event");
    public const string NEW_EVENT_LABEL = _("New Event");
            
    public const string SET_PHOTO_EVENT_LABEL = _("Move Photos");
    public const string SET_PHOTO_EVENT_TOOLTIP = _("Move photos to an event");
    
    public const string MERGE_MENU = _("_Merge Events");
    public const string MERGE_LABEL = _("Merge");
    public const string MERGE_TOOLTIP = _("Combine events into a single event");

    public const string RATING_MENU = _("_Set Rating");
    public const string RATING_LABEL = _("Set Rating");
    public const string RATING_TOOLTIP = _("Change the rating of your photo");

    public const string INCREASE_RATING_MENU = _("_Increase");
    public const string INCREASE_RATING_LABEL = _("Increase Rating");
    
    public const string DECREASE_RATING_MENU = _("_Decrease");
    public const string DECREASE_RATING_LABEL = _("Decrease Rating");

    public const string RATE_UNRATED_MENU = _("_Unrated");
    public const string RATE_UNRATED_COMBO_BOX = _("Unrated");
    public const string RATE_UNRATED_LABEL = _("Rate Unrated");
    public const string RATE_UNRATED_PROGRESS = _("Setting as unrated");
    public const string RATE_UNRATED_TOOLTIP = _("Remove any ratings");
    
    public const string RATE_REJECTED_MENU = _("_Rejected");
    public const string RATE_REJECTED_COMBO_BOX = _("Rejected");
    public const string RATE_REJECTED_LABEL = _("Rate Rejected");
    public const string RATE_REJECTED_PROGRESS = _("Setting as rejected");
    public const string RATE_REJECTED_TOOLTIP = _("Set rating to rejected");
    
    public const string DISPLAY_REJECTED_ONLY_MENU = _("Rejected _Only");
    public const string DISPLAY_REJECTED_ONLY_LABEL = _("Rejected Only");
    public const string DISPLAY_REJECTED_ONLY_TOOLTIP = _("Show only rejected photos");
    
    public const string DISPLAY_REJECTED_OR_HIGHER_MENU = _("All + _Rejected");
    public const string DISPLAY_REJECTED_OR_HIGHER_LABEL = _("Show all photos, including rejected");
    public const string DISPLAY_REJECTED_OR_HIGHER_TOOLTIP = _("Show all photos, including rejected");
    
    public const string DISPLAY_UNRATED_OR_HIGHER_MENU = _("_All Photos");
    public const string DISPLAY_UNRATED_OR_HIGHER_LABEL = _("Show all photos");
    public const string DISPLAY_UNRATED_OR_HIGHER_TOOLTIP = _("Show all photos");

    public const string VIEW_RATINGS_MENU = _("_Ratings");
    public const string VIEW_RATINGS_TOOLTIP = _("Display each photo's rating");

    public const string FILTER_PHOTOS_MENU = _("_Filter Photos");
    public const string FILTER_PHOTOS_LABEL = _("Filter Photos");
    public const string FILTER_PHOTOS_TOOLTIP = _("Limit the number of photos displayed based on a filter");
    
    public const string DUPLICATE_PHOTO_MENU = _("_Duplicate");
    public const string DUPLICATE_PHOTO_LABEL = _("Duplicate");
    public const string DUPLICATE_PHOTO_TOOLTIP = _("Make a duplicate of the photo");

    public const string EXPORT_MENU = _("_Export...");
    
    public const string PRINT_MENU = _("_Print...");
    
    public const string PUBLISH_MENU = _("Pu_blish...");
    public const string PUBLISH_LABEL = _("Publish");
    public const string PUBLISH_TOOLTIP = _("Publish to various websites");

    public const string EDIT_TITLE_MENU = _("Edit _Title...");
    public const string EDIT_TITLE_LABEL = _("Edit Title");

    public const string EDIT_COMMENT_MENU = _("Edit _Comment...");
    public const string EDIT_COMMENT_LABEL = _("Edit Comment");

    public const string EDIT_EVENT_COMMENT_MENU = _("Edit Event _Comment...");
    public const string EDIT_EVENT_COMMENT_LABEL = _("Edit Event Comment");

    public const string ADJUST_DATE_TIME_MENU = _("_Adjust Date and Time...");
    public const string ADJUST_DATE_TIME_LABEL = _("Adjust Date and Time");
    
    public const string ADD_TAGS_MENU = _("Add _Tags...");
    public const string ADD_TAGS_CONTEXT_MENU = _("_Add Tags...");
    public const string ADD_TAGS_TITLE = _("Add Tags");

    public const string PREFERENCES_MENU = _("_Preferences");
    
    public const string EXTERNAL_EDIT_MENU = _("Open With E_xternal Editor");
    
    public const string EXTERNAL_EDIT_RAW_MENU = _("Open With RA_W Editor");
    
    public const string SEND_TO_MENU = _("Send _To...");
    public const string SEND_TO_CONTEXT_MENU = _("Send T_o...");
    
    public const string FIND_MENU = _("_Find...");
    public const string FIND_LABEL = _("Find");
    public const string FIND_TOOLTIP = _("Find an image by typing text that appears in its name or tags");
    
    public const string FLAG_MENU = _("_Flag");
    
    public const string UNFLAG_MENU = _("Un_flag");

    public string launch_editor_failed(Error err) {
        return _("Unable to launch editor: %s").printf(err.message);
    }
    
    public string add_tags_label(string[] names) {
        if (names.length == 1)
            return _("Add Tag \"%s\"").printf(HierarchicalTagUtilities.get_basename(names[0]));
        else if (names.length == 2)
            return _("Add Tags \"%s\" and \"%s\"").printf(
            HierarchicalTagUtilities.get_basename(names[0]),
            HierarchicalTagUtilities.get_basename(names[1]));
        else
            return _("Add Tags");
    }
    
    public string delete_tag_menu(string name) {
        return _("_Delete Tag \"%s\"").printf(name);
    }
    
    public string delete_tag_label(string name) {
        return _("Delete Tag \"%s\"").printf(name);
    }
    
    public const string DELETE_TAG_TITLE = _("Delete Tag");
    public const string DELETE_TAG_SIDEBAR_MENU = _("_Delete");
    
    public const string NEW_CHILD_TAG_SIDEBAR_MENU = _("_New");
    
    public string rename_tag_menu(string name) {
        return _("Re_name Tag \"%s\"...").printf(name);
    }
    
    public string rename_tag_label(string old_name, string new_name) {
        return _("Rename Tag \"%s\" to \"%s\"").printf(old_name, new_name);
    }
    
    public const string RENAME_TAG_SIDEBAR_MENU = _("_Rename...");
    
    public const string MODIFY_TAGS_MENU = _("Modif_y Tags...");
    public const string MODIFY_TAGS_LABEL = _("Modify Tags");
    
    public string tag_photos_label(string name, int count) {
        return ((count == 1) ? _("Tag Photo as \"%s\"") : _("Tag Photos as \"%s\"")).printf(name);
    }
    
    public string tag_photos_tooltip(string name, int count) {
        return ((count == 1) ? _("Tag the selected photo as \"%s\"") :
            _("Tag the selected photos as \"%s\"")).printf(name);
    }
    
    public string untag_photos_menu(string name, int count) {
        return ((count == 1) ? _("Remove Tag \"%s\" From _Photo") :
            _("Remove Tag \"%s\" From _Photos")).printf(name);
    }
    
    public string untag_photos_label(string name, int count) {
        return ((count == 1) ? _("Remove Tag \"%s\" From Photo") :
            _("Remove Tag \"%s\" From Photos")).printf(name);
    }
    
    public static string rename_tag_exists_message(string name) {
        return _("Unable to rename tag to \"%s\" because the tag already exists.").printf(name);
    }
    
    public static string rename_search_exists_message(string name) {
        return _("Unable to rename search to \"%s\" because the search already exists.").printf(name);
    }
    
    public const string DEFAULT_SAVED_SEARCH_NAME = _("Saved Search");
    
    public const string DELETE_SAVED_SEARCH_DIALOG_TITLE = _("Delete Search");
    
    public const string DELETE_SEARCH_MENU = _("_Delete");
    public const string EDIT_SEARCH_MENU = _("_Edit...");
    public const string RENAME_SEARCH_MENU = _("Re_name...");
    
    public string rename_search_label(string old_name, string new_name) {
        return _("Rename Search \"%s\" to \"%s\"").printf(old_name, new_name);
    }
    
    public string delete_search_label(string name) {
        return _("Delete Search \"%s\"").printf(name);
    }
    
    private unowned string rating_menu(Rating rating) {
        switch (rating) {
            case Rating.REJECTED:
                return RATE_REJECTED_MENU;
            case Rating.UNRATED:
                return RATE_UNRATED_MENU;
            case Rating.ONE:
                return RATE_ONE_MENU;
            case Rating.TWO:
                return RATE_TWO_MENU;
            case Rating.THREE:
                return RATE_THREE_MENU;
            case Rating.FOUR:
                return RATE_FOUR_MENU;
            case Rating.FIVE:
                return RATE_FIVE_MENU;
            default:
                return RATE_UNRATED_MENU;
        }
    }

    private unowned string rating_label(Rating rating) {
        switch (rating) {
            case Rating.REJECTED:
                return RATE_REJECTED_LABEL;
            case Rating.UNRATED:
                return RATE_UNRATED_LABEL;
            case Rating.ONE:
                return RATE_ONE_LABEL;
            case Rating.TWO:
                return RATE_TWO_LABEL;
            case Rating.THREE:
                return RATE_THREE_LABEL;
            case Rating.FOUR:
                return RATE_FOUR_LABEL;
            case Rating.FIVE:
                return RATE_FIVE_LABEL;
            default:
                return RATE_UNRATED_LABEL;
        }
    }
    
    private unowned string rating_combo_box(Rating rating) {
        switch (rating) {
            case Rating.REJECTED:
                return RATE_REJECTED_COMBO_BOX;
            case Rating.UNRATED:
                return RATE_UNRATED_COMBO_BOX;
            case Rating.ONE:
                return RATE_ONE_MENU;
            case Rating.TWO:
                return RATE_TWO_MENU;
            case Rating.THREE:
                return RATE_THREE_MENU;
            case Rating.FOUR:
                return RATE_FOUR_MENU;
            case Rating.FIVE:
                return RATE_FIVE_MENU;
            default:
                return RATE_UNRATED_MENU;
        }
    }
    
    private string get_rating_filter_tooltip(RatingFilter filter) {
        switch (filter) {
            case RatingFilter.REJECTED_OR_HIGHER:
                return Resources.DISPLAY_REJECTED_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.ONE_OR_HIGHER:
                return Resources.DISPLAY_ONE_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.TWO_OR_HIGHER:
                return Resources.DISPLAY_TWO_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.THREE_OR_HIGHER:
                return Resources.DISPLAY_THREE_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.FOUR_OR_HIGHER:
                return Resources.DISPLAY_FOUR_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.FIVE_ONLY:
            case RatingFilter.FIVE_OR_HIGHER:
                return Resources.DISPLAY_FIVE_OR_HIGHER_TOOLTIP;
            
            case RatingFilter.REJECTED_ONLY:
                return Resources.DISPLAY_REJECTED_ONLY_TOOLTIP;
            
            case RatingFilter.UNRATED_OR_HIGHER:
            default:
                return Resources.DISPLAY_UNRATED_OR_HIGHER_TOOLTIP;
        }
    }

    private string rating_progress(Rating rating) {
        switch (rating) {
            case Rating.REJECTED:
                return RATE_REJECTED_PROGRESS;
            case Rating.UNRATED:
                return RATE_UNRATED_PROGRESS;
            case Rating.ONE:
                return RATE_ONE_PROGRESS;
            case Rating.TWO:
                return RATE_TWO_PROGRESS;
            case Rating.THREE:
                return RATE_THREE_PROGRESS;
            case Rating.FOUR:
                return RATE_FOUR_PROGRESS;
            case Rating.FIVE:
                return RATE_FIVE_PROGRESS;
            default:
                return RATE_UNRATED_PROGRESS;
        }
    }

    private const int[] rating_thresholds = { 0, 1, 25, 50, 75, 99 };

    private string get_stars(Rating rating) {
        switch (rating) {
            case Rating.ONE:
                return "\xE2\x98\x85";
            case Rating.TWO:
                return "\xE2\x98\x85\xE2\x98\x85";
            case Rating.THREE:
                return "\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85";
            case Rating.FOUR:
                return "\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85";
            case Rating.FIVE:
                return "\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85\xE2\x98\x85";
            default:
                return "";
        }
    }

    private Gdk.Pixbuf? get_rating_trinket(Rating rating, int scale) {
        switch (rating) {
            case Rating.REJECTED:
                return Resources.get_icon(Resources.ICON_RATING_REJECTED, scale);
            // case Rating.UNRATED needs no icon
            case Rating.ONE:
                return Resources.get_icon(Resources.ICON_RATING_ONE, scale);
            case Rating.TWO:
                return Resources.get_icon(Resources.ICON_RATING_TWO, scale*2);
            case Rating.THREE:
                return Resources.get_icon(Resources.ICON_RATING_THREE, scale*3);
            case Rating.FOUR:
                return Resources.get_icon(Resources.ICON_RATING_FOUR, scale*4);
            case Rating.FIVE:
                return Resources.get_icon(Resources.ICON_RATING_FIVE, scale*5);
            default:
                return null;
        }
    }
    
    private void generate_rating_strings() {
        string menu_base = "%s";
        string label_base = _("Rate %s");
        string tooltip_base = _("Set rating to %s");
        string progress_base = _("Setting rating to %s");
        string display_rating_menu_base = "%s";
        string display_rating_label_base = _("Display %s");
        string display_rating_tooltip_base = _("Only show photos with a rating of %s");
        string display_rating_or_higher_menu_base = _("%s or Better");
        string display_rating_or_higher_label_base = _("Display %s or Better");
        string display_rating_or_higher_tooltip_base = _("Only show photos with a rating of %s or better");

        RATE_ONE_MENU = menu_base.printf(get_stars(Rating.ONE));
        RATE_TWO_MENU = menu_base.printf(get_stars(Rating.TWO));
        RATE_THREE_MENU = menu_base.printf(get_stars(Rating.THREE));
        RATE_FOUR_MENU = menu_base.printf(get_stars(Rating.FOUR));
        RATE_FIVE_MENU = menu_base.printf(get_stars(Rating.FIVE));

        RATE_ONE_LABEL = label_base.printf(get_stars(Rating.ONE));
        RATE_TWO_LABEL = label_base.printf(get_stars(Rating.TWO));
        RATE_THREE_LABEL = label_base.printf(get_stars(Rating.THREE));
        RATE_FOUR_LABEL = label_base.printf(get_stars(Rating.FOUR));
        RATE_FIVE_LABEL = label_base.printf(get_stars(Rating.FIVE));

        RATE_ONE_TOOLTIP = tooltip_base.printf(get_stars(Rating.ONE));
        RATE_TWO_TOOLTIP = tooltip_base.printf(get_stars(Rating.TWO));
        RATE_THREE_TOOLTIP = tooltip_base.printf(get_stars(Rating.THREE));
        RATE_FOUR_TOOLTIP = tooltip_base.printf(get_stars(Rating.FOUR));
        RATE_FIVE_TOOLTIP = tooltip_base.printf(get_stars(Rating.FIVE));

        RATE_ONE_PROGRESS = progress_base.printf(get_stars(Rating.ONE));
        RATE_TWO_PROGRESS = progress_base.printf(get_stars(Rating.TWO));
        RATE_THREE_PROGRESS = progress_base.printf(get_stars(Rating.THREE));
        RATE_FOUR_PROGRESS = progress_base.printf(get_stars(Rating.FOUR));
        RATE_FIVE_PROGRESS = progress_base.printf(get_stars(Rating.FIVE));

        DISPLAY_ONE_OR_HIGHER_MENU = display_rating_or_higher_menu_base.printf(get_stars(Rating.ONE));
        DISPLAY_TWO_OR_HIGHER_MENU = display_rating_or_higher_menu_base.printf(get_stars(Rating.TWO));
        DISPLAY_THREE_OR_HIGHER_MENU = display_rating_or_higher_menu_base.printf(get_stars(Rating.THREE));
        DISPLAY_FOUR_OR_HIGHER_MENU = display_rating_or_higher_menu_base.printf(get_stars(Rating.FOUR));
        DISPLAY_FIVE_OR_HIGHER_MENU = display_rating_menu_base.printf(get_stars(Rating.FIVE));

        DISPLAY_ONE_OR_HIGHER_LABEL = display_rating_or_higher_label_base.printf(get_stars(Rating.ONE));
        DISPLAY_TWO_OR_HIGHER_LABEL = display_rating_or_higher_label_base.printf(get_stars(Rating.TWO));
        DISPLAY_THREE_OR_HIGHER_LABEL = display_rating_or_higher_label_base.printf(get_stars(Rating.THREE));
        DISPLAY_FOUR_OR_HIGHER_LABEL = display_rating_or_higher_label_base.printf(get_stars(Rating.FOUR));
        DISPLAY_FIVE_OR_HIGHER_LABEL = display_rating_label_base.printf(get_stars(Rating.FIVE));

        DISPLAY_ONE_OR_HIGHER_TOOLTIP = display_rating_or_higher_tooltip_base.printf(get_stars(Rating.ONE));
        DISPLAY_TWO_OR_HIGHER_TOOLTIP = display_rating_or_higher_tooltip_base.printf(get_stars(Rating.TWO));
        DISPLAY_THREE_OR_HIGHER_TOOLTIP = display_rating_or_higher_tooltip_base.printf(get_stars(Rating.THREE));
        DISPLAY_FOUR_OR_HIGHER_TOOLTIP = display_rating_or_higher_tooltip_base.printf(get_stars(Rating.FOUR));
        DISPLAY_FIVE_OR_HIGHER_TOOLTIP = display_rating_tooltip_base.printf(get_stars(Rating.FIVE));
    }

    private string RATE_ONE_MENU;
    private string RATE_ONE_LABEL;
    private string RATE_ONE_TOOLTIP;
    private string RATE_ONE_PROGRESS;
    
    private string RATE_TWO_MENU;
    private string RATE_TWO_LABEL;
    private string RATE_TWO_TOOLTIP;
    private string RATE_TWO_PROGRESS;

    private string RATE_THREE_MENU;
    private string RATE_THREE_LABEL;
    private string RATE_THREE_TOOLTIP;
    private string RATE_THREE_PROGRESS;

    private string RATE_FOUR_MENU;
    private string RATE_FOUR_LABEL;
    private string RATE_FOUR_TOOLTIP;
    private string RATE_FOUR_PROGRESS;

    private string RATE_FIVE_MENU;
    private string RATE_FIVE_LABEL;
    private string RATE_FIVE_TOOLTIP;
    private string RATE_FIVE_PROGRESS;

    private string DISPLAY_ONE_OR_HIGHER_MENU;
    private string DISPLAY_ONE_OR_HIGHER_LABEL;
    private string DISPLAY_ONE_OR_HIGHER_TOOLTIP;

    private string DISPLAY_TWO_OR_HIGHER_MENU;
    private string DISPLAY_TWO_OR_HIGHER_LABEL;
    private string DISPLAY_TWO_OR_HIGHER_TOOLTIP;

    private string DISPLAY_THREE_OR_HIGHER_MENU;
    private string DISPLAY_THREE_OR_HIGHER_LABEL;
    private string DISPLAY_THREE_OR_HIGHER_TOOLTIP;

    private string DISPLAY_FOUR_OR_HIGHER_MENU;
    private string DISPLAY_FOUR_OR_HIGHER_LABEL;
    private string DISPLAY_FOUR_OR_HIGHER_TOOLTIP;

    private string DISPLAY_FIVE_OR_HIGHER_MENU;
    private string DISPLAY_FIVE_OR_HIGHER_LABEL;
    private string DISPLAY_FIVE_OR_HIGHER_TOOLTIP;

    public const string DELETE_PHOTOS_MENU = _("_Delete");
    public const string DELETE_FROM_TRASH_TOOLTIP = _("Remove the selected photos from the trash");
    public const string DELETE_FROM_LIBRARY_TOOLTIP = _("Remove the selected photos from the library");
    
    public const string RESTORE_PHOTOS_MENU = _("_Restore");
    public const string RESTORE_PHOTOS_TOOLTIP = _("Move the selected photos back into the library");
    
    public const string JUMP_TO_FILE_MENU = _("Show in File Mana_ger");
    public const string JUMP_TO_FILE_TOOLTIP = _("Open the selected photo's directory in the file manager");
    
    public string jump_to_file_failed(Error err) {
        return _("Unable to open in file manager: %s").printf(err.message);
    }
    
    public const string REMOVE_FROM_LIBRARY_MENU = _("R_emove From Library");
    
    public const string MOVE_TO_TRASH_MENU = _("_Move to Trash");
    
    public const string SELECT_ALL_MENU = _("Select _All");
    public const string SELECT_ALL_TOOLTIP = _("Select all items");
    
    private Gtk.IconFactory factory = null;
    private Gee.HashMap<string, Gdk.Pixbuf> icon_cache = null;
    Gee.HashMap<string, Gdk.Pixbuf> scaled_icon_cache = null;
    
    private string HH_MM_FORMAT_STRING = null;
    private string HH_MM_SS_FORMAT_STRING = null;
    private string LONG_DATE_FORMAT_STRING = null;
    private string START_MULTIDAY_DATE_FORMAT_STRING = null;
    private string END_MULTIDAY_DATE_FORMAT_STRING = null;
    private string START_MULTIMONTH_DATE_FORMAT_STRING = null;
        
    public void init () {
        // load application-wide stock icons as IconSets
        factory = new Gtk.IconFactory();

        File icons_dir = AppDirs.get_resources_dir().get_child("icons");
        add_stock_icon(icons_dir.get_child("crop.svg"), CROP);
        add_stock_icon(icons_dir.get_child("redeye.png"), REDEYE);
        add_stock_icon(icons_dir.get_child("image-adjust.svg"), ADJUST);
        add_stock_icon(icons_dir.get_child("pin-toolbar.svg"), PIN_TOOLBAR);
        add_stock_icon(icons_dir.get_child("make-primary.svg"), MAKE_PRIMARY);
        add_stock_icon(icons_dir.get_child("import.svg"), IMPORT);
        add_stock_icon(icons_dir.get_child("straighten.svg"), STRAIGHTEN);
        add_stock_icon(icons_dir.get_child("import-all.png"), IMPORT_ALL);
        add_stock_icon(icons_dir.get_child("enhance.png"), ENHANCE);
        add_stock_icon(icons_dir.get_child("crop-pivot-reticle.png"), CROP_PIVOT_RETICLE);
        add_stock_icon(icons_dir.get_child("merge.svg"), MERGE);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_FLAGGED_PAGE), ICON_FLAGGED_PAGE);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_VIDEOS_PAGE), ICON_VIDEOS_PAGE);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_SINGLE_PHOTO), ICON_SINGLE_PHOTO);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_CAMERAS), ICON_CAMERAS);
        
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_FILTER_FLAGGED), 
            ICON_FILTER_FLAGGED_DISABLED, dim_pixbuf);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_FILTER_PHOTOS), 
            ICON_FILTER_PHOTOS_DISABLED, dim_pixbuf);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_FILTER_VIDEOS), 
            ICON_FILTER_VIDEOS_DISABLED, dim_pixbuf);
        add_stock_icon_from_themed_icon(new GLib.ThemedIcon(ICON_FILTER_RAW), 
            ICON_FILTER_RAW_DISABLED, dim_pixbuf);
        
        factory.add_default();

        generate_rating_strings();
    }
    
    public void terminate() {
    }
    
    /**
     * @brief Helper for getting a format string that matches the
     * user's LC_TIME settings from the system.  This is intended 
     * to help support the use case where a user wants the text 
     * from one locale, but the timestamp format of another.
     * 
     * Stolen wholesale from code written for Geary by Jim Nelson
     * and from Marcel Stimberg's original patch to Shotwell to 
     * try to fix this; both are graciously thanked for their help.
     */
    private void fetch_lc_time_format() {
        // temporarily unset LANGUAGE, as it interferes with LC_TIME
        // and friends.
        string? old_language = Environment.get_variable("LANGUAGE");
        if (old_language != null) {
            Environment.unset_variable("LANGUAGE");
        }
        
        // switch LC_MESSAGES to LC_TIME...
        string? old_messages = Intl.setlocale(LocaleCategory.MESSAGES, null);
        string? lc_time = Intl.setlocale(LocaleCategory.TIME, null);
        
        if (lc_time != null) {
            Intl.setlocale(LocaleCategory.MESSAGES, lc_time);
        }
        
        // ...precache the timestamp string...
        HH_MM_FORMAT_STRING = _("%-I:%M %p");
        HH_MM_SS_FORMAT_STRING = _("%-I:%M:%S %p");
        LONG_DATE_FORMAT_STRING = _("%a %b %d, %Y");
        START_MULTIDAY_DATE_FORMAT_STRING = _("%a %b %d");
        END_MULTIDAY_DATE_FORMAT_STRING = _("%d, %Y");
        START_MULTIMONTH_DATE_FORMAT_STRING = _("%a %b %d");
        
        // ...put everything back like we found it.
        if (old_messages != null) {
            Intl.setlocale(LocaleCategory.MESSAGES, old_messages);
        }
        
        if (old_language != null) {
            Environment.set_variable("LANGUAGE", old_language, true);
        }
    }
    
    /**
     * @brief Returns a precached format string that matches the
     * user's LC_TIME settings.  
     */
    public string get_hh_mm_format_string() {
        if (HH_MM_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return HH_MM_FORMAT_STRING;
    }
    
    public string get_hh_mm_ss_format_string() {
        if (HH_MM_SS_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return HH_MM_SS_FORMAT_STRING;
    }
    
    public string get_long_date_format_string() {
        if (LONG_DATE_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return LONG_DATE_FORMAT_STRING;
    }
    
    public string get_start_multiday_span_format_string() {
        if (START_MULTIDAY_DATE_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return START_MULTIDAY_DATE_FORMAT_STRING;
    }

    public string get_end_multiday_span_format_string() {
        if (END_MULTIDAY_DATE_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return END_MULTIDAY_DATE_FORMAT_STRING;
    }

    public string get_start_multimonth_span_format_string() {
        if (START_MULTIMONTH_DATE_FORMAT_STRING == null) {
            fetch_lc_time_format();
        }
        
        return START_MULTIMONTH_DATE_FORMAT_STRING;
    }

    public string get_end_multimonth_span_format_string() {
        return get_long_date_format_string();
    }

    public File get_ui(string filename) {
        return AppDirs.get_resources_dir().get_child("ui").get_child(filename);
    }

    private const string NONINTERPRETABLE_BADGE_FILE = "noninterpretable-video.png";
    private Gdk.Pixbuf? noninterpretable_badge_pixbuf = null;

    public Gdk.Pixbuf? get_noninterpretable_badge_pixbuf() {
        if (noninterpretable_badge_pixbuf == null) {
            try {
                noninterpretable_badge_pixbuf = new Gdk.Pixbuf.from_file(AppDirs.get_resources_dir().get_child(
                    "icons").get_child(NONINTERPRETABLE_BADGE_FILE).get_path());
            } catch (Error err) {
                error("VideoReader can't load noninterpretable badge image: %s", err.message);
            }
        }
        
        return noninterpretable_badge_pixbuf;
    }
    
    public Gtk.IconTheme get_icon_theme_engine() {
        Gtk.IconTheme icon_theme = Gtk.IconTheme.get_default();
        icon_theme.append_search_path(AppDirs.get_resources_dir().get_child("icons").get_path());
        
        return icon_theme;
    }
    
    // This method returns a reference to a cached pixbuf that may be shared throughout the system.
    // If the pixbuf is to be modified, make a copy of it.
    public Gdk.Pixbuf? get_icon(string name, int scale = DEFAULT_ICON_SCALE) {
        if (scaled_icon_cache != null) {
            string scaled_name = "%s-%d".printf(name, scale);
            if (scaled_icon_cache.has_key(scaled_name))
                return scaled_icon_cache.get(scaled_name);
        }
        
        // stash icons not available through the UI Manager (i.e. used directly as pixbufs)
        // in the local cache
        if (icon_cache == null)
            icon_cache = new Gee.HashMap<string, Gdk.Pixbuf>();
        
        // fetch from cache and if not present, from disk
        Gdk.Pixbuf? pixbuf = icon_cache.get(name);
        if (pixbuf == null) {
            pixbuf = load_icon(name, 0);
            if (pixbuf == null)
                return null;
            
            icon_cache.set(name, pixbuf);
        }
        
        if (scale <= 0)
            return pixbuf;
        
        Gdk.Pixbuf scaled_pixbuf = scale_pixbuf(pixbuf, scale, Gdk.InterpType.BILINEAR, false);
        
        if (scaled_icon_cache == null)
            scaled_icon_cache = new Gee.HashMap<string, Gdk.Pixbuf>();
        
        scaled_icon_cache.set("%s-%d".printf(name, scale), scaled_pixbuf);
        
        return scaled_pixbuf;
    }
    
    public Gdk.Pixbuf? load_icon(string name, int scale = DEFAULT_ICON_SCALE) {
        File icons_dir = AppDirs.get_resources_dir().get_child("icons");
        
        Gdk.Pixbuf pixbuf = null;
        try {
            pixbuf = new Gdk.Pixbuf.from_file(icons_dir.get_child(name).get_path());
        } catch (Error err) {
            critical("Unable to load icon %s: %s", name, err.message);
        }

        if (pixbuf == null)
            return null;
        
        return (scale > 0) ? scale_pixbuf(pixbuf, scale, Gdk.InterpType.BILINEAR, false) : pixbuf;
    }
    
    private void add_stock_icon(File file, string stock_id) {
        Gdk.Pixbuf pixbuf = null;
        try {
            pixbuf = new Gdk.Pixbuf.from_file(file.get_path());
        } catch (Error err) {
            critical("Unable to load stock icon %s: %s", stock_id, err.message);
        }
        
        Gtk.IconSet icon_set = new Gtk.IconSet.from_pixbuf(pixbuf);
        factory.add(stock_id, icon_set);
    }
    
    public delegate void AddStockIconModify(Gdk.Pixbuf pixbuf);
    
    private void add_stock_icon_from_themed_icon(GLib.ThemedIcon gicon, string stock_id, 
        AddStockIconModify? modify = null) {
        Gtk.IconTheme icon_theme = Gtk.IconTheme.get_default();
        icon_theme.append_search_path(AppDirs.get_resources_dir().get_child("icons").get_path());

        Gtk.IconInfo? info = icon_theme.lookup_by_gicon(gicon, 
            Resources.DEFAULT_ICON_SCALE, Gtk.IconLookupFlags.FORCE_SIZE);
        if (info == null) {
            debug("unable to load icon for: %s", stock_id);
            return;
        }
        
        try {
            Gdk.Pixbuf pix = info.load_icon();
            if (modify != null) {
                modify(pix);
            }
            Gtk.IconSet icon_set = new Gtk.IconSet.from_pixbuf(pix);
                factory.add(stock_id, icon_set);
        } catch (Error err) {
            debug("%s", err.message);
        }
    }

    // Get the directory where our help files live.  Returns a string
    // describing the help path we want, or, if we're installed system
    // -wide already, returns null.
    public static string? get_help_path() {
        // Try looking for our 'index.page' in the build directory.
        //
        // TODO: Need to look for internationalized help before falling back on help/C
        
        File help_dir = AppDirs.get_exec_dir().get_child("help").get_child("C");
        File help_index = help_dir.get_child("index.page");
        
        if (help_index.query_exists(null)) {
            string help_path;

            help_path = help_dir.get_path();
         
            if (!help_path.has_suffix("/"))
                help_path += "/";
            
            // Found it.
            return help_path;
        }
        
        // "./help/C/index.page" doesn't exist, so we're installed  
        // system-wide, and the caller should assume the default 
        // help location. 
        return null;
    }

    public static void launch_help(Gdk.Screen screen, string? anchor=null) throws Error {
        string? help_path = get_help_path();
        
        if(help_path != null) {
            // We're running from the build directory; use local help.
            
            // Allow the caller to request a specific page.
            if (anchor != null) {
                help_path +=anchor;
            }
            
            string[] argv = new string[3];
            argv[0] = "gnome-help";
            argv[1] = help_path;
            argv[2] = null;
            
            Pid pid;
            if (Process.spawn_async(AppDirs.get_exec_dir().get_path(), argv, null,
                SpawnFlags.SEARCH_PATH | SpawnFlags.STDERR_TO_DEV_NULL, null, out pid)) {
                return;
            }
            
            warning("Unable to launch %s", argv[0]);
        }
        
        // launch from system-installed help
        if (anchor != null) {
            sys_show_uri(screen, "ghelp:shotwell" + anchor);
        } else {
            sys_show_uri(screen, "ghelp:shotwell");
        }
    }
    
    public string to_css_color(Gdk.RGBA color) {
        int r = (int) (color.red * 255);
        int g = (int) (color.green * 255);
        int b = (int) (color.blue * 255);
        
        return "rgb(%d, %d, %d)".printf(r, g, b);
    }
    
    public const int ALL_DATA = -1;
    
    private static Gee.Map<Gtk.Widget, Gtk.CssProvider> providers = null;
    
    public static void style_widget(Gtk.Widget widget, string stylesheet) {
        if (providers == null)
            providers = new Gee.HashMap<Gtk.Widget, Gtk.CssProvider>();

        if (providers.has_key(widget))
            widget.get_style_context().remove_provider(providers.get(widget));

        Gtk.CssProvider styler = new Gtk.CssProvider();
        
        try {
            styler.load_from_data(stylesheet, ALL_DATA);
        } catch (Error e) {
            warning("couldn't parse widget stylesheet '%s': %s", stylesheet,
                e.message);
            // short-circuit return -- if the stylesheet couldn't be interpreted
            // then we can't do anything more
            return;
        }
        
        widget.get_style_context().add_provider(styler,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        providers.set(widget, styler);
    }
    
    public const string INSET_FRAME_STYLESHEET =
        """ .frame {
               border-style: inset;
               border-width: 1px;
           }""";
           
    public const string SCROLL_FRAME_STYLESHEET =
        """ GtkScrolledWindow {
               border-width: 0;
               border-style: none;
               border-radius: 0;
               padding: 0;
           }
           
            .frame {
                border-width: 1px;
                border-style: inset;
            }""";

    public const string PAGE_STYLESHEET =
        """ .frame {
               border-width: 1px;
               border-style: inset;
               border-radius: 0;
               
               padding: 0;
           }""";
    
    public const string VIEWPORT_STYLESHEET =
        """ GtkViewport {
               border-width: 1px;
               border-style: inset;
               border-radius: 0;
               padding: 0;
           }""";

    public const string TOOLBAR_STYLESHEET_TEMPLATE =
        """
             @define-color primary-bg %s;
             
            .toolbar {
                background-color: @primary-bg;
                border-width: 1px;
                border-color: shade (@primary-bg, 0.75);
                border-style: solid;
            }""";

    public const string SEARCH_BUTTON_STYLESHEET_TEMPLATE =
        """ 
             @define-color primary-bg %s;
             
            .button {
                background-image: none;
                background-color: @primary-bg;
                border-image: none;
                border-color: shade (@primary-bg, 0.75) @primary-bg shade (@primary-bg, 0.75) @primary-bg;
                border-style: solid;
                margin: 5px;
                
                -unico-border-gradient: none;
                -unico-outer-stroke-width: 0;
                -unico-outer-stroke-gradient: none;
                -unico-glow-radius: 0;
                -unico-inner-stroke-width: 0;
                -unico-inner-stroke-color: shade (@primary-bg, 1.1);
            }
            
            .button:prelight {
                border-style: solid;
                border-width: 1px;
                border-color: shade (@primary-bg, 1.1);
                
                -unico-inner-stroke-color: shade (@primary-bg, 1.1);
                -unico-inner-stroke-width: 0;

                -unico-outer-stroke-width: 1px;
                -unico-outer-stroke-color: shade (@primary-bg, 0.8);
            }
            
            .button:active {
                background-image: none;
                background-color: shade (@primary-bg, 0.75);
                border-style: solid;
                border-width: 1px;
                border-color: shade (@primary-bg, 0.6);
                
                -unico-outer-stroke-width: 1px;
                -unico-outer-stroke-color: shade (@primary-bg, 1.1);
            }""";
}

