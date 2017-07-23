all:
	g++ src/*.cpp -o com.github.rugglcon.weather `pkg-config gtkmm-3.0 --cflags --libs`

clean:
	rm Weather
