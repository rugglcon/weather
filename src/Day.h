#ifndef DAY_H
	#define DAY_H

#include <string>

class Day {
	private:
		std::string weekday;
		int high;
		int low;
		int humidity;
		int precipitation;
		std::string conditions;
	public:
		Day();
		~Day();
		inline std::string get_conditions() { return this->conditions; }
		inline std::string get_weekday() { return this->weekday; }
		inline int get_high() { return this->high; }
		inline int get_low() { return this->low; }
		inline int get_humidity() { return this->humidity; }
		inline int get_precipitation() { return this->precipitation; }
};

#endif
