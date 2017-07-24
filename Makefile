all:
	g++ src/*.cpp -o com.github.rugglcon.weather `pkg-config gtkmm-3.0 --cflags --libs` `pkg-config --cflags --libs curlpp`

clean:
	rm com.github.rugglcon.weather
