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
public class Forecast {
    private string deg_type;
    private Day[] days;

    public Forecast (Json.Array forecast, string deg_type) {
        days = new Day[5];
        this.deg_type = deg_type;
        parse_forecast (forecast);
    }

    public Day get_day (int num_day) {
        return this.days[num_day];
    }

    public Day[] get_all_days () {
        return this.days;
    }

    public void parse_forecast (Json.Array forecast_data) {
        var util = new WeatherUtil ();
        var temp_day = forecast_data.get_element (0).get_object ();
        var cur_day = util.get_weekday (temp_day);
        var i = 0;
        days[i] = new Day (temp_day, false, this.deg_type);
        for (var j = 0; j < forecast_data.get_length (); j++) {
            var ele = forecast_data.get_element (j).get_object ();
            if (cur_day != util.get_weekday (ele) || days[i].is_full ()) {
                cur_day = util.get_weekday (ele);
                days[++i] = new Day (ele, false, this.deg_type);
            }
            days[i].fill_hour (ele);
        }
    }
}
