public class Weather {
    private Day today;
    private Forecast forecast;

    public Weather (Json.Array forecast_weather, 
                    Json.Object cur_weather) {
        forecast = new Forecast (forecast_weather);
        stdout.puts ("set new Forecast\n");
        today = new Day (cur_weather, true);
        stdout.puts ("set new today\n");
    }

    public Day get_today () {
        return this.today;
    }

    public Forecast get_forecast () {
        return this.forecast;
    }
}
