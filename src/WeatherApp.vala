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

        window.add (label);
        window.show_all ();
    }

    public void request_weather_data () {
        var window = this.get_active_window ();
    }
    
    public static int main(string[] args) {
        var app = new WeatherApp ();
        return app.run (args);
    }
}
