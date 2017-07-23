#include "Forecast.h"
#include "globals.h"

using namespace std;

Forecast::Forecast() {
	for(int i = 0; i < FORECAST_DAYS; i++) {
		days[i] = new Day();
	}

	today = days[0];
}

Forecast::~Forecast() {
	for(int i = 0; i < FORECAST_DAYS; i++) {
		delete days[i];
	}
}

vector<string> Forecast::get_next_days() {
	vector<string> tmp_days;
	for(int i = 0; i < FORECAST_DAYS; i++) {
		tmp_days.push_back(days[i]->get_weekday());
	}
	return tmp_days;
}

Day *Forecast::get_day(int num_day) {
	return days[num_day];
}
