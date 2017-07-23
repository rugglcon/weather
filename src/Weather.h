#ifndef WEATHER_H
	#define WEATHER_H

#include <cstdlib>
#include "Forecast.h"

using namespace std;

class Forecast;

class Weather {
	private:
		Forecast *forecast;

	public:
		Weather();
		~Weather();
		
};

#endif
