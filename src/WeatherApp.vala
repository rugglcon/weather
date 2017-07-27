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

        window.add (grid);
        window.show_all ();
    }

    public string parse_weather_data (string data) {
        //stdout.puts ((string) data);
        try {
            var parser = new Json.Parser ();
            parser.load_from_data (data, -1);
            
            var root_object = parser.get_root ().get_object ();
            var response = root_object.get_object_member ("city");
            var city_name = response.get_string_member ("name");

            return (string) city_name;
        } catch (Error e) {
            return "something went wrong parsing JSON";
        }

        return "whoops";
    }

    public void request_weather_data () {
        var window = this.get_active_window ();
        Gtk.Entry zip_code = null;
        var old_grid = (Gtk.Grid) window.get_child ();
        if (old_grid != null) {
            zip_code = (Gtk.Entry) old_grid.get_child_at (1, 0);

        }

        string url = "http://api.openweathermap.org/data/2.5/forecast?zip=%s&appid=919f430ae0c3ef379b192023fb803cd8".printf (zip_code.get_text ());
        Soup.Session session = new Soup.Session ();
        Soup.Message message = new Soup.Message ("GET", url);
        session.send_message (message);

        var code = parse_weather_data ((string) message.response_body.data);
        var label = new Gtk.Label(code);
        stdout.printf ("\n");
        stdout.puts(code);
        stdout.printf ("\n");

        old_grid.destroy ();
        var new_grid = new Gtk.Grid ();
        new_grid.add (label);
        window.add (new_grid);
        window.show_all ();
    }
    
    public static int main(string[] args) {
        var app = new WeatherApp ();
        return app.run (args);
    }
}
