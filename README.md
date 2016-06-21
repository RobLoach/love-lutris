# Lutro Lutris Launcher

Launch [Lutris](http://lutris.net) games through [Love2D](https://love2d.org/), or [RetroArch](http://libretro.com)+[Lutro](http://github.com/libretro/libretro-lutro).

![Lutro Lutris Launcher Screenshot](resources/screenshot.png)

## Installation

### [Love2D](http://love2d.org)

1. Install [Lutris](https://lutris.net)

2. Install [Love2D](https://love2d.org)

3. Download the [Lutro Lutris Launcher](http://github.com/RobLoach/lutro-lutris)
	```
	git clone https://github.com/RobLoach/lutro-lutris.git
	```

4. Launch Love2D with the Lutris launcher:
	```
	love lutro-lutris
	```

### [RetroArch](http://libretro.com)

1. Install [Lutris](https://lutris.net)

2. Install [RetroArch](http://libretro.com)

3. Install the [libretro-lutro](https://github.com/libretro/libretro-lutro) core

4. Download the [Lutro Lutris Launcher](http://github.com/RobLoach/lutro-lutris)
	```
	git clone https://github.com/RobLoach/lutro-lutris.git
	```

5. Launch RetroArch with the Lutro core:
	```
	retroarch -L "path/to/lutro_libretro.so" lutro-lutris
	```
