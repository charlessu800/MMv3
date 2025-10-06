# Lab 3 Checkoff Solutions NOTE THIS IS FOR IR WE SWITCHED THE ORDER

## Checkoff #1

1. Just looking to see if the readings are good and consistent with other mice. If not, they might have trouble later.

```python
import board
import time
import digitalio
from analogio import AnalogIn

# adc
l_adc = AnalogIn(board.GP28)

#emitter 
l_en  = digitalio.DigitalInOut(board.GP7)
l_en.direction = digitalio.Direction.OUTPUT
l_en.value = False

# sensors
lir_a   = digitalio.DigitalInOut(board.GP5)
lir_a.direction  = digitalio.Direction.OUTPUT
lir_a.drive_mode = digitalio.DriveMode.OPEN_DRAIN
lir_a.value = True # high Z mode

# STUDENT DO THIS
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

In order to simplify the whole process of multiplexing and reading from multiple sensors, we wrote a library. Upload, if you havent already irsensor.py from sanity/, to serve as the library. Read through irsensor.py to instantiate and use it to understand the parameters of IRSensors.

1. Verify all sensors are in working order

## Checkoff #3

1. Just check that they ran the code and have reasonable looking constants. The slope tends to be the same with a slight difference in offset. Around `a=0.03` and `b=-50` appear to be the average.
2. This involves combining taking the sensor readings from the previous checkpoint and implementing the provided equation. The file provided to students is also an example solution so it should work properly. 
