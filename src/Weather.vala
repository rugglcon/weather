public class Weather {
    private Day today;
    private Forecast forecast;

    public Weather () {
        forecast = new Forecast ();
    }

    public Day get_today () {
        return this.today;
    }

    public Forecast get_forecast () {
        return this.forecast;
    }
}
