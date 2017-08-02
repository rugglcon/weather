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

    public int64 get_temp () {
        var util = new WeatherUtil ();
        if (deg_type == "C") {
            return util.get_celcius (this.temp);
        } else {
            return util.get_fahrenheit (this.temp);
        }
    }

    public int get_time () {
        return this.time;
    }
}
