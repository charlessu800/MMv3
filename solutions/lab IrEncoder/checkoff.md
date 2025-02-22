# IR Section
## Checkoff #1

1. Just looking to see if the readings are good and consistent with other mice. If not, they might have trouble later.

```python
import board
import time
import digitalio
from analogio import AnalogIn

l_en  = digitalio.DigitalInOut(board.GP7)
l_en.direction = digitalio.Direction.OUTPUT
l_en.value = False
l_adc = AnalogIn(board.GP28)

lir_a   = digitalio.DigitalInOut(board.GP5)
lir_a.direction  = digitalio.Direction.OUTPUT
lir_a.drive_mode = digitalio.DriveMode.OPEN_DRAIN
lir_a.value = True # high Z mode

lir_b   = digitalio.DigitalInOut(board.GP6)
lir_b.direction  = digitalio.Direction.OUTPUT
lir_b.drive_mode = digitalio.DriveMode.OPEN_DRAIN
lir_b.value = True # high Z mode

while True:
    l_en.value = True

    lir_a.value = False
    time.sleep(0.001)
    print(l_adc.value, end=" ")
    lir_a.value = True

    lir_b.value = False
    time.sleep(0.001)
    print(l_adc.value)
    lir_b.value = True

    l_en.value = False

    time.sleep(0.05)
```

## Checkoff #2

1. Verify all sensors are in working order

## Checkoff #3

1. Just check that they ran the code and have reasonable looking constants. The slope tends to be the same with a slight difference in offset. Around `a=0.03` and `b=-50` appear to be the average.
2. This involves combining taking the sensor readings from the previous checkpoint and implementing the provided equation. The file provided to students is also an example solution so it should work properly. 

# Encoder Section

## Checkoff #1

1. Values are constant.
2. It toggles between 0 and 1 faster.
3. To tell direction. Waveform looks the same forward and backward with just one.

## Checkoff #2

1. There's a couple of ways to do it, but here's one.

```python
import board
import digitalio

# left encoder
a = digitalio.DigitalInOut(board.GP12)
b = digitalio.DigitalInOut(board.GP13)

counter = 0
position = 0
a_prev = a.value

def leftEncoderRisingEdge():
    global position # access global position
    position += 1 if b.value else -1

while True:
    a_val = a.value
    if a_val and not a_prev: # rising edge
        leftEncoderRisingEdge()
    a_prev = a_val

    if counter % 1000 == 0:
        print(position)
    counter += 1
```

2. About 217. Multiply the gearbox ratio by the number of north poles on the motor magnet.
3. Basically can miss edges and takes up too much CPU time.
4. Use a timer to measure time between edges.
5. Just reverses the direction of measurement.

## Checkoff #3

1. Does it go up and down.
2. Interrupts don't miss edges and don't need the CPU constantly reading. There's still a limit on speed bc of interrupt and function overhead.

