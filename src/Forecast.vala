public class Forecast {
    private Day[] days;
    private Day today;

    public Forecast () {
        
    }

    public Day get_day(int num_day) {
        return this.days[num_day];
    }

    public Day[] get_all_days () {
        return this.days;
    }

    public Day get_today () {
        return this.today;
    }
}
