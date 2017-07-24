#include <gtkmm-3.0/gtkmm.h>
#include <curlpp/cURLpp.hpp>
#include <curlpp/Options.hpp>
#include "json/json.h"
#include "json/json-forwards.h"
#include "WeatherApp.h"

using namespace Gtk;

int main(int argc, char *argv[]) {
	curlpp::Cleanup clean; /* curl Cleanup class
														calls curl init and curl
														terminate for us */

	WeatherApp *app = new WeatherApp();


	std::ostringstream os;
	cout << curlpp::options::Url(std::string("api.openweathermap.org/data/2.5/forecast?zip=50010&appid=919f430ae0c3ef379b192023fb803cd8"));
	return 0;

	string asAskedInQuestion = os.str();
	cout << asAskedInQuestion << endl;

	Window window;
	window.set_default_size(1024, 768);
	window.set_title("Weather");

	return app->run(window, argc, argv);
}
