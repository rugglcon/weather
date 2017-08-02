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

    public Forecast get_forecast () {
        return this.forecast;
    }
}
