import board
import time

import digitalio
import neopixel
import rotaryio
import pwmio

# from ds28e05  import DS28E05
from irsensor import IRSensors
import adafruit_motor.motor as motor

""" Peripherals """

# debug
led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT

but = digitalio.DigitalInOut(board.GP3)
but.pull = digitalio.Pull.UP

rgb = neopixel.NeoPixel(board.GP4, 1)

# extra stuffs
# eeprom = DS28E05(board.GP2)

# IR sensors
ir = IRSensors(
    board.GP7,  board.GP5,  board.GP6,  board.GP28, # left
    board.GP9,  board.GP10, board.GP11, board.GP26, # center
    board.GP21, board.GP20, board.GP22, board.GP27  # right
)

# encoders
lenc = rotaryio.IncrementalEncoder(board.GP12, board.GP13)
renc = rotaryio.IncrementalEncoder(board.GP19, board.GP18)

# motors
lmot = motor.DCMotor(
    pwmio.PWMOut(board.GP16, frequency=20000),
    pwmio.PWMOut(board.GP17, frequency=20000)
)
rmot = motor.DCMotor(
    pwmio.PWMOut(board.GP15, frequency=20000),
    pwmio.PWMOut(board.GP14, frequency=20000)
)
lmot.decay_mode = motor.SLOW_DECAY
rmot.decay_mode = motor.SLOW_DECAY

""" Main """

if __name__ == "__main__":
    # debug
    print("Hello World! Press the button next to the battery to begin tests.")
    while (but.value):
        pass

    print("Blinking the LED underneath your micromouse...")
    for _ in range(6):
        led.value = not led.value
        time.sleep(0.25)

    print("Turning on Neopixel on top of your micromouse...")
    rgb[0] = (255, 0, 0)
    time.sleep(0.5)
    rgb[0] = (0, 255, 0)
    time.sleep(0.5)
    rgb[0] = (0, 0, 255)
    time.sleep(0.5)
    rgb[0] = (1, 1, 1)

    # extra stuffs
    # if eeprom.devices:
    #     print("Detected the following 1-Wire devices...")
    #     for d in eeprom.devices:
    #         print("\t", "".join("{:02x}".format(x) for x in d.rom))

    #     eeprom.write(0, 0, b'MMv3.1')
    #     if not eeprom.read(0, 0, 6) == b'MMv3.1':
    #         print("FAIL! EEPROM write mismatch!")
    # else:
    #     print("FAIL! No 1-Wire devices detected!")

    # IR sensors
    print("Scanning IR sensors! Press button next to the battery to start and stop.")
    while (but.value):
        pass
    time.sleep(0.05)
    while (not but.value):
        pass

    while (but.value):
        ir.scan()
        print("lir_a:", ir.lir_a, "\t", "lir_b:", ir.lir_b, "\t",
                "cir_a:", ir.cir_a, "\t", "cir_b:", ir.cir_b, "\t",
                "rir_a:", ir.rir_a, "\t", "rir_b:", ir.rir_b
        )
        time.sleep(0.05)
    time.sleep(0.05)
    while (not but.value):
        pass

    # encoders
    print("Reading encoders! Press button next to the battery to start and stop.")
    while (but.value):
        pass
    time.sleep(0.05)
    while (not but.value):
        pass

    while (but.value):
        print("lenc:", lenc.position, "\t", "renc:", renc.position)
        time.sleep(0.05)
    time.sleep(0.05)
    while (not but.value):
        pass

    # motors
    print("Testing motors! Plug in battery and turn on switch. Press button next to the battery to start.")
    print("(Beware your mouse may begin to run off on its own. You may want to pick it up just in case ;))\n")

    while (but.value):
        pass

    print("Did you actually turn on the switch? You can tell if the red LED light underneath the motor driver is on. If so, please press the button next to the battery to actually make the test the motors please.\n")

    time.sleep(0.5)
    
    while (but.value):
        pass

    print("Full speed forward")
    lmot.throttle = 1
    rmot.throttle = 1
    time.sleep(0.5)
    print("Brake")
    lmot.throttle = 0
    rmot.throttle = 0
    time.sleep(0.5)
    print("Full speed backward")
    lmot.throttle = -1
    rmot.throttle = -1
    time.sleep(0.5)
    print("Brake")
    lmot.throttle = 0
    rmot.throttle = 0
    time.sleep(0.5)
    print("Low speed forward")
    lmot.throttle = 0.25
    rmot.throttle = 0.25
    time.sleep(0.5)
    print("Brake")
    lmot.throttle = 0
    rmot.throttle = 0
    time.sleep(0.5)
    print("Low speed backward")
    lmot.throttle = -0.25
    rmot.throttle = -0.25
    time.sleep(0.5)
    print("Brake")
    lmot.throttle = 0
    rmot.throttle = 0
    time.sleep(0.5)

    print("Done with tests!\n")
    
    print("Press button next to the battery to just drive straight now :P")
    print("Forever! :O\n")

    while (but.value):
        pass

    print("JK!\n")
    time.sleep(1)
    print("IMPORTANT (please read the following as it will make using your mouse easier):")
    print(" 1) Hit 'Ctrl + C', while in the screen/serial monitor/etc or flip the switch off to stop the mouse.")
    print(" 2) If you have hit 'Ctrl + C' but now want your program to run again hit 'Ctrl  + D' now in order to reload your program. This is assuming you haven't made any changes to your code and you already uploaded your program into your Pi Pico after having hit 'Ctrl + C' \n")


    print("Please press the button next to the battery now to actually make the mouse drive straight\n")
    
    while (but.value):
        pass

    while True:
        delta = lenc.position - renc.position
        u = 0.001 * delta
        lmot.throttle = 0.25 - u
        rmot.throttle = 0.25 + u
        print(delta)
        time.sleep(0.05)
