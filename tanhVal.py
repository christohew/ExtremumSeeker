from math import tanh


import numpy as np
import math

in_array = np.linspace(-20,20,81)
print(in_array)
tanhVal = np.tanh(in_array)

print(tanhVal)


# +-5 from -0.9999 to 0.9999
# so 11 is diff between on/off for standard tanh(x)
# if you have tanh(b*x) --ignoring + c then:
# bx=-5 is off and bx=5 is on
# so... if b=1, then delT=11
# if b=2, then delT=6
# if b=3, then delT=4.3
# if b=
# basically, delT=10/b+1
# so b=10/(delT-1)
