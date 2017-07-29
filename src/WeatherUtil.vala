public class WeatherUtil {
    private string APP_ID = "919f430ae0c3ef379b192023fb803cd8";

    public WeatherUtil () {}

    public Json.Object parse_data (string data) {
        Json.Object root_object = null;
        try {
            var parser = new Json.Parser ();
            parser.load_from_data (data, -1);
            
            root_object = parser.get_root ().get_object ();
        } catch (Error e) {
            stdout.puts ("something went wrong parsing JSON");
        }

        return root_object;
    }

    public Json.Object send_get_weather (string type, string zip, string country) {
        string url = "http://api.openweathermap.org/data/2.5/%s?zip=%s,%s&appid=%s".printf (type, zip, country, APP_ID);

        Soup.Session session = new Soup.Session ();
        Soup.Message message = new Soup.Message ("GET", url);
        session.send_message (message);
        stdout.puts ((string) message.response_body.data);
        return parse_data ((string) message.response_body.data);
    }
}
