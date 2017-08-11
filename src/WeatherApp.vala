/*
* Copyright (c) 2011-2017 Connor Ruggles (https://rugglcon.github.io)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Connor Ruggles <cruggles@iastate.edu>
*/
public class WeatherApp : Gtk.Application {
    private Location location;

    public WeatherApp () {
        Object (application_id: "com.github.rugglcon.weather",
                flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        if (get_windows ().length () > 0) {
            get_windows ().data.present ();
            return;
        }
        var window = new Gtk.ApplicationWindow (this);
        window.set_default_size (1024, 768);
        window.title = _("Weather");
        window.set_position (Gtk.WindowPosition.CENTER);
        window.set_border_width (12);

        var zip_label = new Gtk.Label (_("Enter zipcode: "));
        var zip_entry = new Gtk.Entry ();
        var country_label = new Gtk.Label (_("Enter country (e.g., us for United States):"));
        var country_entry = new Gtk.Entry ();

        var submit = new Gtk.Button.with_label (_("Submit"));
        submit.clicked.connect (() => {
            request_weather_data ();
        });

        var grid = new Gtk.Grid ();
        grid.attach (zip_label, 0, 0);
        grid.attach (zip_entry, 1, 0);
        grid.attach (country_label, 0, 1);
        grid.attach (country_entry, 1, 1);
        grid.attach (submit, 1, 2);
        grid.row_spacing = 6;
        grid.column_spacing = 2;

        window.add (grid);
        window.show_all ();
    }

    public void get_weather_task (Gtk.Label l1, Gtk.Label l2, Gtk.Label l3) {
        this.location.update_today (l1, l2, l3);
    }

    public void request_weather_data () {
        var window = this.get_active_window ();
        Gtk.Entry zip_code = null;
        Gtk.Entry country = null;
        var old_grid = (Gtk.Grid) window.get_child ();
        if (old_grid != null) {
            zip_code = (Gtk.Entry) old_grid.get_child_at (1, 0);
            country = (Gtk.Entry) old_grid.get_child_at (1, 1);
        }


        var util = new WeatherUtil ();
        var weather_object = util.send_get_weather ("forecast",
                                            zip_code.get_text (),
                                            country.get_text ());

        location = new Location(weather_object.get_object_member ("city").
                                get_string_member ("name"), zip_code.
                                get_text (), country.get_text ());
        old_grid.destroy ();

        location.set_weather_info (weather_object);

        var new_grid = new Gtk.Grid ();

        var label = new Gtk.Label(location.get_name ());
        var today = location.get_weather ().get_today ();
        var cur_temp = today.get_cur_temp ();
        var weekday = today.get_day ();
        //new_grid.add (new Gtk.Label (today.get_high ().to_string ()));
        //new_grid.add (new Gtk.Label (today.get_low ().to_string ()));

        var update_btn = new Gtk.Button.with_label (_("Refresh"));
        var temp_label = new Gtk.Label (cur_temp.to_string ());
        new_grid.add (temp_label);
        var day_label = new Gtk.Label (weekday); 
        new_grid.add (day_label);
        var cond_label = new Gtk.Label (today.get_conditions ());
        new_grid.add (cond_label);

        update_btn.clicked.connect (() => {
            this.get_weather_task (temp_label, day_label, cond_label);
        });

        new_grid.add (label);
        new_grid.add (update_btn);
        new_grid.column_spacing = 4;
        window.add (new_grid);
        window.show_all ();
    }

    public static int main(string[] args) {
        var app = new WeatherApp ();
        return app.run (args);
    }
}
