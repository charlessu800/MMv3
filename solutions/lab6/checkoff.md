# Lab 6 Checkoff Solutions

## Checkoff #1

1. See that the mouse drives straight. Our motors are actually pretty consistent so the difference may not be obvious. The angular error doesn't actually need to go to 0 since we're measuring distance not velocity. It just needs to be stable. Also take a look at their code since this is the first time there's a decent amount of it. Try to encourage them towards clean and readable code. Solution code is in [chk1_code.py](chk1_code.py).
2. Some combination of a target theta minus the actual theta. They could just say theta, but make sure say we can generalize to any desired theta.
```python
left_dist  = lenc.position * MM_PER_TICK
right_dist = renc.position * MM_PER_TICK

theta = (right_dist - left_dist) / WHEELBASE_DIAMETER
theta_target = 0

e_ang = theta_target - theta    # This is the error term
```

3. $ K_p = 0.5 $
Why? What do we know? 

$$ u(t) = error * K_p, error = 2 rad, u(t) = 1 $$

Let's plug in what we know to find our unknown, $K_p$

$$ 1 = 2 rad * K_p $$

$$ K_p = 1 / 2 $$

(P.S. don't mind the dropping of the units radian, idk why tbh)

4. Too low and it corrects too slowly or not at all. Too high and it might oscillate and go unstable.

## Checkoff #2

1. See that the mouse drives straight and stops after around 20cm. Don't worry too much about extreme precision. Solution code is in [chk2_code.py](chk2_code.py).
2. Some combination of a target distance minus the current distance.
```python
dist  = (left_dist + right_dist) / 2
dist_target = 200

e_lin = dist_target - dist  # This is the error term
```
3. $ K_p = 0.01 $
Why? What do we know? 

$$ u(t) = error * K_p, error = 100mm, u(t) = 1 $$

Let's plug in what we know to find our unknown, $K_p$

$$ 1 = 100 * K_p $$

$$ K_p = 1 / 100 $$

(P.S. don't mind the dropping of the units radian, idk why tbh)
