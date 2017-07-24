#ifndef WEATHERAPP_H
	#define WEATHERAPP_H

#include <gtkmm.h>
#include "Location.h"

class WeatherApp : public Gtk::Application {
	private:
		std::vector<Location> locations;
	public:
		WeatherApp();
		//WeatherApp(int& argc, char **argv, std::string id);
		~WeatherApp();
};

#endif
