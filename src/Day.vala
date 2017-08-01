public class Day {
    private string weekday;
    private int64 high;
    private int64 low;
    private int64 humidity;
    private int precipitation;
    private string conditions;
    private int64 cur_temp;
    private bool is_today;
    private Hour[] times;

    public Day (Json.Object info, bool today) {
        is_today = today;
        times = new Hour[8];
        for (var i = 0; i < 8; i++) {
            times[i] = null;
        }

        if (is_today) {
            fill_today (info);
        }
        stdout.printf ("%lld\n", cur_temp);
    }

    public void fill_hour (Json.Object info) {
        var util = new WeatherUtil ();
    }

    private void fill_today (Json.Object info) {
        var util = new WeatherUtil ();
        this.weekday = util.get_weekday (info);
        var tmp = info.get_array_member ("weather");
        var weather = tmp.get_element (0).get_object ();
        this.conditions = weather.get_string_member ("main");
        var main = info.get_object_member ("main");
        this.humidity = main.get_int_member ("humidity");
        this.high = main.get_int_member ("temp_max");
        this.low = main.get_int_member ("temp_min");
        this.cur_temp = main.get_int_member ("temp");
    }

    public bool is_full() {
        return (times[times.length - 1] != null ? true : false);
    }

    public string get_day () {
        return this.weekday;
    }

    public int64 get_high () {
        return this.high;
    }

    public int64 get_low () {
        return this.low;
    }

    public int64 get_humidity () {
        return this.humidity;
    }

    public int get_precipitation () {
        return this.precipitation;
    }

    public string get_conditions () {
        return this.conditions;
    }

    private class Hour {
        int time;
        string condition;
        int temp;
    }
}
