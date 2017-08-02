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
            stdout.puts (_("object is null"));
            return;
        }

        var util = new WeatherUtil ();
        var weather_object = util.send_get_weather ("weather", 
                                                    zip, country);

        var results = info.get_array_member ("list");

        this.weather = new Weather (results, weather_object, "F");
    }

    public string get_name () {
        return this.name;
    }

    public Weather get_weather () {
        return this.weather;
    }
}
