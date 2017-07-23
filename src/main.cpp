#include <gtkmm.h>
#include "WeatherApp.h"

using namespace Gtk;

int main(int argc, char *argv[]) {
	WeatherApp app = 
		Application::create(argc, argv,
				"org.gtkmm.examples.base");

	Window window;
	window.set_default_size(1024, 768);

	return app->run(window);
}
