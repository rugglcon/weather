#ifndef FORECAST_H
	#define FORECAST_H

#include "Day.h"
#include "globals.h"
#include <vector>

using namespace std;

class Forecast {
	private:
		Day *days[FORECAST_DAYS];
		Day *today;
	public:
		Forecast();
		~Forecast();
		vector<string> get_next_days();
		Day *get_day(int num_day);
};

#endif
