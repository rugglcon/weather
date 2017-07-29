public class Location {
    private Weather weather;
    private string name;
    private string zip;
    private string country;

    public Location (string name, string zip_code, string country) {
        this.name = name;
        this.zip = zip_code;
        this.country = country;
    }

    public void set_weather_info (Json.Object info) {
        if (info == null) {
            stdout.puts ("object is null");
            return;
        }

        var util = new WeatherUtil ();
        var weather_object = util.send_get_weather ("weather", 
                                                    zip, country);

        var results = info.get_array_member ("list");

        this.weather = new Weather (results, weather_object);

        foreach (var three_hour in results.get_elements ()) {
            var item = three_hour.get_object ();
            var time = new DateTime.from_unix_utc (item.get_int_member ("dt"));
            var day = "";
            switch (time.get_day_of_week ()) {
                case 1:
                    day = _("Sunday");
                    break;
                case 2:
                    day = _("Monday");
                    break;
                case 3:
                    day = _("Tuesday");
                    break;
                case 4:
                    day = _("Wednesday");
                    break;
                case 5:
                    day = _("Thursday");
                    break;
                case 6:
                    day = _("Friday");
                    break;
                case 7:
                    day = _("Saturday");
                    break;
            }
            stdout.printf ("%s\n", day);
        }
    }

    public string get_name () {
        return this.name;
    }
}
