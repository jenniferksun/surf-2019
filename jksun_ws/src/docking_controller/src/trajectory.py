#!/usr/bin/env python

import numpy as np

def ramp_time(x1, x2, a, v):
    d = x2-x1
    if d < 0:
        a = -a
        v = -v
    # d/2 = 1/2 a * ta^2
    ta = np.sqrt(2*(d/2)/a)  # acceleration time
    tc = 0  # coasting time
    if abs(a*ta) > abs(v):
        ta = v/a
        tc = (d - 2*1/2*a*ta**2)/v
    return 2*ta+tc

def ramp(x1, x2, a, v, t):
    d = x2-x1
    if d < 0:
        a = -a
        v = -v
    # d/2 = 1/2 a * ta^2
    ta = np.sqrt(2*(d/2)/a)  # acceleration time
    tc = 0  # coasting time
    if abs(a*ta) > abs(v):
        ta = v/a
        tc = (d - 2*1/2*a*ta**2)/v
    accelerate_p = lambda t: x1 + 1/2*a*t**2
    accelerate_v = lambda t: a*t
    coast_p = lambda t: accelerate_p(ta) + v*(t)
    coast_v = lambda t: v
    deccelerate_p = lambda t: coast_p(tc) - 1/2*a*t**2 + accelerate_v(ta)*t
    deccelerate_v = lambda t: accelerate_v(ta) - a*t
    if t < 0:
        return 0, 0, x1
    elif t < ta:
        return a, accelerate_v(t), accelerate_p(t)
    elif t < ta+tc:
        return 0, coast_v(t-ta), coast_p(t-ta)
    elif t < ta+tc+ta:
        return -a, deccelerate_v(t-ta-tc), deccelerate_p(t-ta-tc)
    else:
        return 0, 0, x2
