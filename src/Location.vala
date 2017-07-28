public class Location {
    private Weather weather;
    private string name;

    public Location (string name) {
        this.name = name;
    }

    public void set_weather_info (Json.Object info) {
        if (info == null) {
            stdout.puts ("object is null");
            return;
        }

        var results = info.get_array_member ("list");

        stdout.printf ("%lld\n", results.get_length ());

        foreach (var three_hour in results.get_elements ()) {
            var item = three_hour.get_object ();
            stdout.printf ("%s\n", item.get_string_member ("dt_txt"));
        }
    }

    public string get_name () {
        return this.name;
    }
}
