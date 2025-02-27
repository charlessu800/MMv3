# Sanity

This lab provides code to test all aspects of your mouse and identify any hardware defects. If at any point in this lab a test is not passed, ask an instructor for help debugging.

1. Plug mouse into your computer and upload the latest **firmware.uf2** (see [releases](https://adafruit-circuit-python.s3.amazonaws.com/bin/raspberry_pi_pico/en_US/adafruit-circuitpython-raspberry_pi_pico-en_US-8.2.0.uf2) by dragging the file into the `RPI-RP2` folder that shows up. It should disappear and reappear as a `CIRCUITPY` folder.
    * If you've uploaded firmware before, you'll need to hold the `BOOTSEL` button on the Pi Pico while plugging in.
2. Download the latest CircuitPython [libraries](https://circuitpython.org/libraries) (Bundle for Version 7.x) and upload the following ones to the lib/ folder on your mouse.
    * adafruit_motor/
    * adafruit_onewire/
    * neopixel.mpy
3. Upload the contents of [sanity/](../labs/sanity/) to the CircuitPython drive that shows up when you plug your mouse into your computer.
4. Find the associated serial port for your mouse.
    <details>
    <summary>Windows</summary>

    Open up `Device Manager` and check the `Ports (COM & LPT)` dropdown. Your serial (COM) port is one of those. If it's hard to identify, try unplugging and replugging your mouse and see which COM port disappears.

    </details>
    <details>
    <summary>MacOS</summary>

    Run `ls  /dev/tty.*` in Terminal. The correct port is one of those. If it's hard to identify, try unplugging and replugging your mouse and see which port disappears.

    </details>
    <details>
    <summary>Linux</summary>

    Hello there! A fellow power user you are. Your distro may be different, but chances are it's under something like `/dev/ttyACM0`.

    </details>
5. Bring up a serial monitor on that serial port (baud rate doesn't matter). There are many options of software to use, but the following are what I personally use.
    * **Windows** - [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
    * **MacOS** - [SerialTools](https://apps.apple.com/us/app/serialtools/id611021963?mt=12) and [screen](https://en.wikipedia.org/wiki/GNU_Screen) after running ls /dev/tty.* youre going to do type into your terminal screen "whatever you identified as the correct port"
    * **Linux** - [screen](https://en.wikipedia.org/wiki/GNU_Screen)
6. Follow the instructions printed to the serial monitor. You may have to press CTRL-C and CTRL-D to reset if you don't see anything.
    * IR sensor readings should be around 30,000-60,000 without a surface in front of them and under 5,000 with your hand right in front of them.
    * Encoders should be \~217 ticks per revolution.
