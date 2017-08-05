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

    public Json.Object send_get_weather (string type,
                                         string zip, string country) {
        string url = "";
        if (country == "" || country == "us" || country == "US") {
            url = "http://api.openweathermap.org/data/2.5" +
                "/%s?zip=%s&appid=%s".printf (type, zip, APP_ID);
        } else {
            url = "http://api.openweathermap.org/data/2.5" +
                "/%s?zip=%s,%s&appid=%s".printf (type, zip, country, APP_ID);
        }

        Soup.Session session = new Soup.Session ();
        Soup.Message message = new Soup.Message ("GET", url);
        session.send_message (message);
        //stdout.puts ((string) message.response_body.data);
        return parse_data ((string) message.response_body.data);
    }

    public double get_fahrenheit (int64 kelvin) {
        return (1.8 * (kelvin - 273.15)) + 32;
    }

    public double get_celcius (int64 kelvin) {
        return kelvin - 273.15;
    }

    public string get_weekday (Json.Object hour) {
        var time = new DateTime.from_unix_utc (hour.get_int_member ("dt"));
        var day = "";
        switch (time.get_day_of_week ()) {
            case 1:
                day = _("Monday");
                break;
            case 2:
                day = _("Tuesday");
                break;
            case 3:
                day = _("Wednesday");
                break;
            case 4:
                day = _("Thursday");
                break;
            case 5:
                day = _("Friday");
                break;
            case 6:
                day = _("Saturday");
                break;
            case 7:
                day = _("Sunday");
                break;
        }
        return day;
    }
}
