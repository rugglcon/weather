all:
	g++ src/*.cpp -o Weather `pkg-config gtkmm-3.0 --cflags --libs`

clean:
	rm Weather
