# Lab 4: IR Sensors
Note to staff: we changed the order
## Background

IR sensors work by sending out IR light and measuring the amount reflected back. They take a lot more work to calibrate and are surface dependent, but are far cheaper and faster than the ToF sensors we used to use. Our mouse has 6 of these sensors split into 3 pairs (center/front, left, right). Having 2 sensors per side allows us to statically determine both the distance and angle of the nearest surface.

IR sensors consist of both an IR emitter and detector. IR emitters draw around 50mA each when on, so we have a switch to turn them off when not needed. IR detectors shift their IV curve based on light intensity like in the following graph.

<p align="center">
    <img height="250px" src="https://courses.engr.illinois.edu/ece110/sp2021/content/courseNotes/files/images/photodiodes/PhotodiodeIV.png"/>
</p>

To convert that to a readable voltage signal, we'll use a setup similar to a resistor divider. It's noisier and less tunable compared to a transimpedance amplifier, but uses only one resistor. By placing the IR detector in reverse bias, we use the flatter region of the IV curve. Since the current varies linearly with light intensity, the voltage also varies linearly. MMv3 uses the following circuit (pull-up resistor not shown).

<p align="center">
    <img height="200px" src="imgs/ir_circuit.png"/>
</p>

## Read One Sensor

Since we have 6 total analog sensors but only 3 ADC pins on the Pi Pico, we need to multiplex 2 sensors onto each pin. We use one extra pin on each IR detector in open-drain mode to fully disconnect or connect it to ground. To read in one sensor, we perform the following steps in the while loop.

1. Enable the IR emitters (set pin to `True`).
2. Enable the chosen sensor by connecting it to ground (set pin to `False`).
3. Wait around 1ms for things to settle.
4. Take the reading.
5. Disable the chosen sensor by setting the pin to open-drain (set pin to `True`).
6. Disable the IR emitters (set pin to `False`).

Baesd on the above steps and the `AnalogIn` [documentation](https://circuitpython.readthedocs.io/en/latest/shared-bindings/analogio/index.html), fill out the below TODOs to print out readings from the left IR sensor pair (`lir_a` and `lir_b`).

```python
import board
import time
import digitalio
from analogio import AnalogIn

# adc 
l_adc = """TODO call AnalogIn on GP28"""

# emitter 
l_en = """TODO create DigitalInOut output on GP7"""
l_en.direction = digitalio.Direction.OUTPUT
l_en.value = False

# sensors
lir_a = digitalio.DigitalInOut(board.GP5)
lir_a.direction = digitalio.Direction.OUTPUT
lir_a.drive_mode = digitalio.DriveMode.OPEN_DRAIN
lir_a.value = True # high Z mode

lir_b = """TODO create DigitalInOut on GP6 in open-drain mode, use lir_a as direct inspiration"""
lir_b.direction  = ...
lir_b.drive_mode = ...
lir_b.value = ...

while True:
    # TODO enable IR emitters using l_en set one of its variables to a (boolean)

    # TODO enable chosen sensor lir_a or lir_b by setting one of its variable to false
    # TODO wait a bit, 1ms should do time. ...
    # TODO take analog reading for future printing print(l_adc. , end="")
    # TODO disable chosen sensor lir_a or lir_b 

    # TODO enable chosen sensor
    #
    # Repeat above for this sensor
    #
    # TODO disable IR emitters using l_en 
    time.sleep(0.05)
```

### Checkoff #1

1. Demonstrate one working sensor.

## Read All the Sensors

In order to simplify the whole process of multiplexing and reading from multiple sensors, we wrote a library. Upload, if you havent already `irsensor.py` from [sanity/](../labs/sanity), to serve as the library. Read through `irsensor.py` to instantiate and use it to understand the parameters of IRSensors.

```python
import board
import time

from irsensor import IRSensors

ir = IRSensors(
    board.GP7,  board.GP5,  board.GP6,  board.GP28, # left
    board.GP9,  board.GP10, board.GP11, board.GP26, # center
    board.GP21, board.GP20, board.GP22, board.GP27  # right
)

while True:
    ir.scan()
    print("lir_a:", ir.lir_a, "\t", "lir_b:", ir.lir_b, "\t",
            "cir_a:", ir.cir_a, "\t", "cir_b:", ir.cir_b, "\t",
            "rir_a:", ir.rir_a, "\t", "rir_b:", ir.rir_b)
    time.sleep(0.05)
```

### Checkoff #2

1. Demonstrate all of your working sensors.

## Calibration

Let's try estimating actual distances from the sensor values. Empirically, the relationship is linear below around 60mm and rises sharply beyond that due to the angled sensors seeing above the wall. Based on maze cell size, we really only need accurate distances around 50mm (~2in) for wall following and just binary wall detection beyond that.

<p align="center">
    <img height="250px" src="imgs/ir_graph.png"/>
    <br>
    <a><b>IR Sensor Linear Region</b></a>
</p>

To save you some time, we're also going to include code for you to get proper distance readings: [`distance.py`](../labs/lab4/distance.py). 
Pay attention to this area specifically: 

```python
# IR sensors
ir = IRSensors(
    board.GP7,  board.GP5,  board.GP6,  board.GP28, # left
    board.GP9,  board.GP10, board.GP11, board.GP26, # center
    board.GP21, board.GP20, board.GP22, board.GP27, # right
    avg = 10
)

""" Main """

dist = Distance(ir,
    0.0299, -63.6, 0.0195, -39.1,
    0.0300, -60.4, 0.0251, -47.9,
    0.0258, -50.5, 0.0292, -54.0,
)

"""Make Sure to allign the constants in the right place:
        la_a, la_b, lb_a, lb_b,
        ca_a, ca_b, cb_a, cb_b,
        ra_a, ra_b, rb_a, rb_b,
"""
```

Within the file we make an instance of the Distance class and passing in the arguments for the __a__ and __b__ constants. The numbers given out are placeholders and you should use the constants you got from the previous section and fill them in appropriately. 

### Checkoff #3

1. Run the calibration code and save the constants somewhere.
2. Using the constants, fill in the distance code and check that it runs correctly.
