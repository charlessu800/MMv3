# Lab 3 Checkoff Solutions NOTE THIS IS FOR IR WE SWITCHED THE ORDER

## Checkoff #1

1. Just looking to see if the readings are good and consistent with other mice. If not, they might have trouble later.

```python
import board
import time
import digitalio
from analogio import AnalogIn

l_adc = AnalogIn(board.GP28)

l_en  = digitalio.DigitalInOut(board.GP7)
l_en.direction = digitalio.Direction.OUTPUT
l_en.value = False


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
