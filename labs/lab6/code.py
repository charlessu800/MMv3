import board
import time
from math import pi

import digitalio
import neopixel
import rotaryio
import pwmio
import adafruit_motor.motor as motor

""" Constants """

ENCODER_TICKS_PER_REVOLUTION = 217
WHEELBASE_DIAMETER = 78.0 # mm
WHEEL_DIAMETER = 34.0 # mm

""" Peripherals """

# debug
led = digitalio.DigitalInOut(board.LED)
led.direction = digitalio.Direction.OUTPUT

but = digitalio.DigitalInOut(board.GP3)
but.pull = digitalio.Pull.UP

rgb = neopixel.NeoPixel(board.GP4, 1)

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

def constrain(val, min_val, max_val):
    return min(max_val, max(val, min_val))

# compute dist and theta
def compute_odometry():
    MM_PER_TICK = pi * WHEEL_DIAMETER / ENCODER_TICKS_PER_REVOLUTION

    # compute left dist
    left_dist = ...
    # compute right dist 
    right_dist = ...

    #compute dist and theta
    
    # what should you be returning here? ... , ...
    return """TODO"""


# compute correction and error terms for a target theta
e_ang_sum, e_ang_prev = 0, 0
def compute_u_ang(theta, theta_target):
    Kp, Ki, Kd = 0.1, 0.005, 0.01 # Proportional (Kp), Integral (Ki), and Derivative (Kd)

    global e_ang_sum, e_ang_prev
    #whats the _error_ of our angle?
    e_ang = ...

    # Update i
    e_ang_sum += ...
    e_ang_sum = constrain(e_ang_sum, -20, 20) # windup

    # update d
    e_ang_deriv = ... 
    e_ang_prev  = e_ang

    u_ang = ... # you should be using Kp Ki and Kd here, use the PID formula
    return u_ang, ...

# compute correction and error terms for a target distance
e_lin_sum, e_lin_prev = 0, 0
def compute_u_lin(dist, dist_target):
    # follow a similar process as above, set the wind up constraint to (-100, 100)
    ...
    
    u_lin = ...
    u_lin = constrain(u_lin, -0.3, 0.3)
    return """TODO"""

def run_control_loop(theta_target, dist_target):
    dist, theta = compute_odometry()
    u_ang, e_ang = compute_u_ang(theta, theta_target)
    u_lin, e_lin = compute_u_lin(dist, dist_target)
    lmot.throttle = constrain(u_lin - u_ang, -1, 1)
    rmot.throttle = constrain(u_lin + u_ang, -1, 1)
    return e_ang, e_lin

def turn_left():
    reset_odometry()
    while abs(run_control_loop(pi/2, 0)[0]) > 0.05:
        time.sleep(0.02)
    reset_controls()
    lmot.throttle, rmot.throttle = 0, 0

if __name__ == "__main__":
    #Try using this to turn left instead
    while True:
        e_ang, e_lin = run_control_loop(0, 200)
        print(e_ang, e_lin)
        time.sleep(0.02) # ~50Hz loop
