#include <gtkmm-3.0/gtkmm.h>
#include "WeatherApp.h"

using namespace Gtk;

int main(int argc, char *argv[]) {
	WeatherApp *app = new WeatherApp();

	Window window;
	window.set_default_size(1024, 768);
	window.set_title("Weather");

	return app->run(window, argc, argv);
}
