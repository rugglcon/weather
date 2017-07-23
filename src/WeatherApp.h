#ifndef WEATHERAPP_H
	#define WEATHERAPP_H

#include <gtkmm.h>
#include "Location.h"

class WeatherApp : public Gtk::Application {
	private:
		std::vector<Location> locations;

};

#endif
