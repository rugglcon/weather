#ifndef FORECAST_H
	#define FORECAST_H

#include "Day.h"
#include <vector>

using namespace std;

class Forecast {
	private:
		Day days[];
		Day today;
	public:
		Forecast();
		~Forecast();
		vector<string> get_next_days();
};

#endif
