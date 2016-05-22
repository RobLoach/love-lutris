# Lutro Lutris Launcher

Launch [Lutris](http://lutris.net) games through  [RetroArch](http://libretro.com) and [Lutro](http://github.com/libretro/libretro-lutro).

![Lutro Lutris Launcher Screenshot](resources/screenshot.png)

## Installation

1. Install [Lutris](https://lutris.net)

2. Install [RetroArch](http://libretro.com)

3. Install the [libretro-lutro](https://github.com/libretro/libretro-lutro) core

4. Download the [Lutro Lutris Launcher](http://github.com/RobLoach/lutro-lutris)
  ```
  git clone --recursive https://github.com/RobLoach/lutro-lutris.git
  ```

5. Download vendor libraries ([lunajson](https://github.com/grafi-tt/lunajson))
  ```
  make
  ```

6. Launch RetroArch with the Lutro core:
  ```
  retroarch -L "/usr/lib/libretro/lutro_libretro.so" lutro-lutris
  ```
