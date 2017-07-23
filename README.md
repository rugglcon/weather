# cpp-weather

Weather app written in C++

## Build, Test, and Install

### Build Dependencies

+ libgtkmm-3.0-dev
+ meson
+ g++

### Building

Run `meson build` in the top-level directory, then enter the `build` directory and run `ninja`:

	meson build
	cd build
	ninja

### Installation

To install, run `ninja install`. You may need `sudo` permissions for installation.
