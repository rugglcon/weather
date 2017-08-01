public class WeatherApp : Gtk.Application {
    private Location location;

    public WeatherApp () {
        Object (application_id: "com.github.rugglcon.weather",
                flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
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

        location = new Location(weather_object.get_object_member ("city").get_string_member ("name"), zip_code.get_text (), country.get_text ());
        location.set_weather_info (weather_object);

        old_grid.destroy ();
        var new_grid = new Gtk.Grid ();

        var label = new Gtk.Label(location.get_name ());
        var today = location.get_weather ().get_today ();
        stdout.printf ("%lld\n", today.get_high ());
        stdout.printf ("%lld\n", today.get_low ());
        stdout.printf ("%lld\n", today.get_conditions ());
        //new_grid.add (new Gtk.Label (today.get_high ().to_string ()));
        //new_grid.add (new Gtk.Label (today.get_low ().to_string ()));
        //new_grid.add (new Gtk.Label (today.get_conditions ()));

        new_grid.add (label);
        window.add (new_grid);
        window.show_all ();
    }
    
    public static int main(string[] args) {
        var app = new WeatherApp ();
        return app.run (args);
    }
}
