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
