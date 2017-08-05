/*
* Copyright (c) 2011-2017 Your Organization (https://yourwebsite.com)
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
* Authored by: Author <author@example.com>
*/
public class Hour {
    int time;
    string condition;
    string details;
    int64 temp;
    string weekday;
    string deg_type;

    public Hour (int time, string deg_type) {
        this.weekday = get_day ();
        this.time = time;
        this.deg_type = deg_type;
    }

    public string get_day () {
        return this.weekday;
    }

    public void set_detail (string details) {
        this.details = details;
    }

    public string get_detail () {
        return this.details;
    }

    public void set_temp (int64 temp) {
        this.temp = temp;
    }

    public string get_cond () {
        return this.condition;
    }

    public void set_cond (string con) {
        this.condition = con;
    }

    public int get_temp () {
        var util = new WeatherUtil ();
        if (deg_type == "C") {
            return (int) util.get_celcius (this.temp);
        } else {
            return (int) util.get_fahrenheit (this.temp);
        }
    }

    public int get_time () {
        return this.time;
    }
}
