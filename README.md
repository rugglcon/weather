# Weather

Vala weather app written for elementary OS. Gets the current weather plus a forecast for the next four days.

## Build, Test, and Install

### Build Dependencies

+ gtk+-3.0
+ meson
+ valac

### Building

Run `meson build` in the top-level directory, then enter the `build` directory and run `ninja`:

	meson build
	cd build
	ninja

### Installation

To install, run `ninja install`. You may need `sudo` permissions for installation.
