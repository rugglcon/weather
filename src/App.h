#ifndef WEATHERAPP_H
	#define WEATHERAPP_H

#include <gtkmm>
#include "Location.h"

class App : public Gtk::Application {
	private:
		std::vector<Location> locations;

};

#endif
