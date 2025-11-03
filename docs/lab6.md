# Lab 6: Intro to (P) of PID

## Background

You'll need your code from lab five here!!
You may have noticed that if you let your mouse drive forward for long enough, it'll start drifting to one side. That's because we're just using open-loop control where we apply some input and hope we get the desired output. For various reasons, including but not limited to the following, our mouse will not drive straight even given the same power to both motors.

* The mouse isn't perfectly balanced as all things should be.
* The ground is not perfectly flat.
* Our motors aren't exactly the same.

To fix this, we'll apply something called closed-loop control. Also known as feedback control, we take measurements from the encoders to adjust the power to our motors and drive straight. For example, if we are veering to the left based on encoder readings, we can increase power to the left motor and decrease power to the right motor to correct it.

One common way to do feedback control is PID. For now, you'll be implementing just the P part of it. Conceptually, feedback controllers try to minimize some error which is the difference between a measured value (aka process variable) and setpoint.

For a P controller, we vary our motor power proportionally to our error. That is, the larger our error, the more power we apply to correct for it.

<p align="center">
    $u(t) = K_pe(t)$
</p>

## Drive Straight

Copy over the skeleton code in [labs/lab5/](../labs/lab5) onto your mouse. Our code is getting too long to just copy paste every time. By default, the code makes the mouse drive forward at 20% speed. Next, copy over your code from [Lab 5](lab5.md) to compute `dist` and `theta` based on encoder readings.

Your job is to apply P control to make the mouse drive straight. The linear velocity doesn't matter too much, just the fact that it doesn't veer left or right. To do this, it would help to answer the following questions.

* What is $\theta$ when driving straight?
* What is the error when driving straight?
* Given an error, how do you change each motor's power to correct for it?

When implementing the P controller, start with $K_p$ values of around 0.1 and tune up and down from there based on performance. To make sure the mouse does move forward, add 0.2 to the `throttle` for each motor in addition to your correction term.

$K_p$: proportional gain. This value is responsible for determining how strongly we'll be correcting for error. 


``` python
... 
# import statements
# Define these 
# Constants 
# Encoders
# Motors
...
lmot.decay_mode = motor.SLOW_DECAY
rmot.decay_mode = motor.SLOW_DECAY

def constrain(val):
    return min(1, max(val, -1))
if __name__ == "__main__":
    MM_PER_TICK = ...

    while True:
        # Calculate the left distance value
        left_dist = ...
        # Calculate the right distance value
        right_dist = ...
        # Get both theta and distance from lab 
        dist = ...
        theta = ...

        # set Kp to a low value to begin, 0.1 etc, what do you notice when you vary this? 
        k_p = ...
        # What is our target theta value?
        theta_target = ...
        # whats the error of our target and the theta?
        angular_error = ...
        
        # define the steering correction, Our correction should be proporitonal to our angular error
        steer_correction = ...
    
        #set the throttles of the left/right motor.
        # Lets constrain it to 0.2 plus or minus our steering correction depending on the motor
        lmot.throttle = constrain(...)
        rmot.throttle = constrain(...)

        print(angular_error)
    
        time.sleep(0.05)
```

After implementing this code, place your mouse on the ground and let it go straight. You likely won't get a perfectly straight mouse, this code by itself is not enough to completely correct our motor's direction; though it should be slightly better than just forward. This is fine for shorter distances purpose, but you'll quickly see your mouse veer off when it travels further than a few inches.

### Checkoff #1

1. Demonstrate your working P controller. Print out your error term too.
2. How do you compute the error term?
3. If we want our applied correction power $u(t)$ to be maximized $(u(t) = 1)$ when the error is 2 radians, what is $K_p$?
4. What happens when $K_p$ is too low? How about too high? What value did you end up using?

## Go the Distance

When solving mazes, it is quite useful to be able to drive forward a set distance. Let's swap out the 0.2 we blindly added to the `throttle` for a linear correction term. Your job is to get your mouse to drive straight forward 200mm (~8inches) and then stop. Like with driving straight, it'd help to answer the following questions.

* What is the error for traveling a set distance?
* Given an error, how do you change each motor's power to correct for it?

When implementing the P controller, start with $K_p$ values of 0.1 and tune. Don't remove your angular correction code from before since we still want to drive straight. Since we want to leave a little wiggle room for the angular correction, limit the linear correction term to around 0.3.

```python
...
def constrain(val, min_val, max_val):
    return min(max_val, max(val, min_val))

if __name__ == "__main__":
    MM_PER_TICK = ...

    while True:
        left_dist  = ...
        right_dist = ...

        dist  = ...
        theta = ...

        # angular P control
        k_p = ...
        theta_target = ...

        angular_error = ...
        steer_correction = ...

        # linear P control
        Kp_lin = ...
        dist_target = ... # in mm

        # linear error?
        lin_error = ...
        lin_correction = constrain(..., -0.3, 0.3)

        # combine linear correction and steer correction to ensure that our mouse's motor
        # differentials are corrected
        lmot.throttle = constrain(lin_correction - steer_correction, -1, 1)
        rmot.throttle = constrain(lin_correction + steer_correction, -1, 1)

        print(angular_error, lin_error)

        time.sleep(0.05)
```
### Summary

We're implementing this portion to account for errors in distance traveled forward, this is in contrast to the last code portion which was to ensure our mouse was driving straight. We're correcting for under/overshooting the target distance by adjusting overall speed.

The linear controller provides the speed control over the motors, while the angular controller provides correction for the differential between motors. Both corrections are combined so we can simultaneously maintain straight motion AND reach the target distance.

### Checkoff #2

1. Demonstrate your working P controller. Print out your error term too.
2. How do you compute the error term?
3. If we want our applied correction power $u(t)$ to be maximized $(u(t) = 1)$ when the error is 100mm, what is $K_p$?
