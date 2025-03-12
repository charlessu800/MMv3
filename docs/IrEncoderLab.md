# Lab 3: Sensory Overload 

## Background

Originally, this entire lab consisted of two labs total: IR sensing and Encoders. Nowadays we've merged them into two for your enjoyment and hopefully ease-of-learning. We're gonna start with encoders and then move to IR sensors.
# Encoders 
## Background

When we're navigating the maze, we'd like to keep track of a couple things.

* Is it driving straight?
* How far has it driven?
* What direction is it facing?

To answer these questions, we'll use the **quadrature encoder** sensors mounted on the back of your motors. They consist of a spinning magnet and two Hall effect sensors mounted 90° apart. Hall effect sensors measure the presence of magnetic fields. In our case, they output a `True` when closer to a north pole and `False` when closer to a south pole.

<p align="center">
    <img height="300px" src="imgs/quadrature_encoder.gif"/>
    <br>
    <a><b>Hall sensor signal (y-axis) vs. time (x-axis)</b></a>
</p>

## Waveform Viewing

Let's try reading raw values from the encoder. Upload the following code.

```python
import board
import time
import digitalio

# a and b Hall effect sensors of left encoder
a = digitalio.DigitalInOut(board.GP12)
b = digitalio.DigitalInOut(board.GP13)

while True:
    print(int(a.value), int(b.value))
    time.sleep(0.001)
```

Pull up a serial monitor and start spinning the left motor at various speeds. Notice how the values start changing. Can you tell which direction the motor is spinning with just one input?

### Checkoff #1

1. What's the output when the motor is stationary? Is it a certain level? Is it constant?
2. How does the output change when you spin the motor faster?
3. Why do we need two Hall effect sensors per motor?

## Polling

Next let's try tracking the position of the left wheel. We're going to use a technique called polling which involves repeatedly reading a signal to detect changes. Fill in the `leftEncoderRisingEdge` function below.

```python
import board
import digitalio

# a and b Hall effect sensors of left encoder
a = digitalio.DigitalInOut(board.GP12)
b = digitalio.DigitalInOut(board.GP13)

counter = 0
position = 0
a_prev = a.value

def leftEncoderRisingEdge():
    global position # access global position
    """TODO increment or decrement position depending on which way the motor is spinning
    Try experimenting with the instance variables of a and b (we only need either a or b). Refer to the
    waveform code from earlier for an idea, think about rising edges"""

while True:
    a_val = a.value
    if a_val and not a_prev: # rising edge of a
        leftEncoderRisingEdge()
    a_prev = a_val

    if counter % 1000 == 0:
        print(position)
    counter += 1
```

After uploading the code, pull up a serial monitor and start spinning the motor in both directions. The position should go up and down as you do it!

### Checkoff #2

1. Show your working code.
2. Roughly how many "ticks" correspond to a revolution? How do you think this is computed?
3. What issues might the "polling" method have?
4. Now that we can measure position, how might we measure velocity?
5. What effect does swapping the A and B pins have on how we measure position?

## Interrupts

Polling can be inefficient and even miss edges if the wheel is spinning too quickly. Moreover, constantly having to check a signal takes up a lot of CPU time that could be used for other purposes. While polling is adequate in some cases, for an encoder we need something better.

Interrupts literally interrupt the CPU by making it pause its current task and run some other code before resuming. In our case, we want to trigger an interrupt when a pin has a rising edge. The low-level setup for interrupts usually involves enabling some registers and assigning a function to run. CircuitPython actually abstracts all of this away for us in the `rotaryio` module.

Upload the following code.

```python
import board
import time
import rotaryio

enc = rotaryio.IncrementalEncoder(board.GP12, board.GP13)

while True:
    print(enc.position)
    time.sleep(0.001)
```

Pull up a serial monitor and start spinning the motor.

### Checkoff #3

1. Demonstrate the working code.
2. Why might we use interrupts over polling?

# IR Sensors

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

Since we have 6 total analog sensors but only 3 ADC pins on the Pi Pico, we need to multiplex 2 sensors onto each pin. We use one extra pin on each IR detector in open-drain mode to fully disconnect or connect it to ground. To read in one sensor, we perform the following steps.

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
l_adc = """TODO create AnalogIn on GP28"""

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

while True:
    # TODO enable IR emitters using l_en
    # TODO enable chosen sensor lir_a or lir_b
    # TODO wait a bit, 1ms should do
    # TODO take analog reading for future printing
    # TODO disable chosen sensor lir_a or lir_b
    # TODO disable IR emitters using l_en
    time.sleep(0.05)
```

### Checkoff #1

1. Demonstrate one working sensor.

## Read All the Sensors

In order to simplify the whole process of multiplexing and reading from multiple sensors, we wrote a library. Upload `irsensor.py` from [sanity/](../labs/sanity) to serve as the library. We've provided the code below to allow all IR sensors to take measurements. Run the code below to make sure every sensor works!

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

Let's try estimating actual distances from the sensor values. Empirically, the relationship is linear below around 60mm and rises sharply beyond that due to the angled sensors seeing above the wall. Based on maze cell size, we really only need accurate distances around 50mm for wall following and just binary wall detection beyond that.

<p align="center">
    <img height="250px" src="imgs/ir_graph.png"/>
    <br>
    <a><b>IR Sensor Linear Region</b></a>
</p>

Load up [`constants.py`](../labs/lab4/constants.py) which contains code to automate finding the constants. You'll be using a maze wall and ruler to take readings at various distances. The code then uses least squares to fit a line to the points and prints out the constants at the end. The equation using these constants to convert sensor readings to distances can be expressed as follows.

<p align="center">
    $distance = a \cdot sensor + b$
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
