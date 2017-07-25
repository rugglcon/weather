public class Day {
    private string weekday;
    private int high;
    private int low;
    private int humidity;
    private int precipitation;
    private string conditions;

    public Day (string day) {
        weekday = day;
    }

    public string get_day () {
        return this.weekday;
    }

    public int get_high () {
        return this.high;
    }

    public int get_low () {
        return this.low;
    }

    public int get_humidity () {
        return this.humidity;
    }

    public int get_precipitation () {
        return this.precipitation;
    }

    public string get_conditions () {
        return this.conditions;
    }
}
