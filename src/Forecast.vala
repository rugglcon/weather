public class Forecast {
    private Day[] days;

    public Forecast () {
        days = new Day[5];
        for (int i = 0; i < 5; i++) {
            days[i] = new Day ();
        }
    }

    public Day get_day (int num_day) {
        return this.days[num_day];
    }

    public Day[] get_all_days () {
        return this.days;
    }
}
