import numpy as np
from matplotlib import pyplot as plt
from scipy.optimize import curve_fit


def find_nearest(array, value):
    array = np.asarray(array)
    idx = (np.abs(array - value)).argmin()
    return idx, array[idx]

def func(x, a, b, c):
    return a/(x-b) + c

x = np.linspace(-60,60,120001)
b = np.linspace(0.1,70,100)
b_arg = []
t = []
for i in b:
    tanhVal = np.tanh(i*x)
    upper, upperVal = find_nearest(tanhVal, 0.99)
    lower, lowerVal = find_nearest(tanhVal, -0.99)
    t.append(x[upper]-x[lower])
    b_arg.append(i)

plt.plot(b_arg, t, 'b-', label='data')
popt, pcov = curve_fit(func, b_arg, t)
print(popt)
# plt.plot(b_arg, func(b_arg, *popt), 'r-')
plt.plot(b_arg, func(b_arg, *popt), 'r-',
         label='fit: a=%5.3f, b=%5.3f, c=%5.3f' % tuple(popt))
plt.show()

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
