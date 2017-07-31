public class Forecast {
    private Day[] days;

    public Forecast (Json.Array forecast) {
        days = new Day[5];
    }

    public Day get_day (int num_day) {
        return this.days[num_day];
    }

    public Day[] get_all_days () {
        return this.days;
    }

    public void parse_forecast (Json.Array forecast_data) {
    }
}
