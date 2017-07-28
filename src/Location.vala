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
            var time = new DateTime.from_unix_utc (item.get_int_member ("dt"));
            stdout.printf ("%d\n", time.get_day_of_week ());
        }
    }

    public string get_name () {
        return this.name;
    }
}
