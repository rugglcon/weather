#ifndef LOCATION_H
	#define LOCATION_H

#include "Weather.h"

class Location {
	private:
		Weather *weather;
		std::string name;
};

#endif
