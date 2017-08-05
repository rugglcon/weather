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
public class Weather {
    private Day today;
    private Forecast forecast;
    private string deg_type;

    public Weather (Json.Array forecast_weather,
                    Json.Object cur_weather, string deg_type) {
        this.deg_type = deg_type;

        forecast = new Forecast (forecast_weather, this.deg_type);
        today = new Day (cur_weather, true, this.deg_type);
    }

    public Day get_today () {
        return this.today;
    }

    public void update_today (Json.Object cur_weather) {
        today = new Day (cur_weather, true, this.deg_type);
    }

    public Forecast get_forecast () {
        return this.forecast;
    }
}
