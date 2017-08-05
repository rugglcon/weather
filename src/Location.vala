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
public class Location {
    private Weather weather;
    private string name;
    private string zip;
    private string country;
    private string deg_type;

    public Location (string name, string zip_code, string country) {
        this.name = name;
        this.zip = zip_code;
        this.country = country;
        if (this.country == "us" || this.country == "US" || this.country == "") {
            this.deg_type = "F";
        } else {
            this.deg_type = "C";
        }
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

        this.weather = new Weather (results, weather_object, this.deg_type);
    }

    public void update_today () {
        var util = new WeatherUtil ();
        var weather_object = util.send_get_weather ("weather",
                                                    zip, country);
        this.weather.update_today (weather_object);
    }

    public string get_name () {
        return this.name;
    }

    public Weather get_weather () {
        return this.weather;
    }
}
