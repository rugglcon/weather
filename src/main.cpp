#include <gtkmm-3.0/gtkmm.h>
#include "WeatherApp.h"

using namespace Gtk;

int main(int argc, char *argv[]) {
	auto app = 
		Application::create(argc, argv,
				"org.gtkmm.examples.base");

	Window window;
	window.set_default_size(1024, 768);
	window.set_title(_("Weather");

	return app->run(window);
}
