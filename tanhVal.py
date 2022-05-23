"""
This script is used to determine a function that can relate 
`b` in the equation y=tanh(bx) to the time spent in -0.99<y<0.99
"""

import numpy as np
from matplotlib import pyplot as plt
from scipy.optimize import curve_fit

def find_nearest(array, value):
    """Function takes an array and returns the index and element closest to the value argument"""
    array = np.asarray(array)
    idx = (np.abs(array - value)).argmin()
    return idx, array[idx]

def func(x, a, b, c):
    """Recursive function to fit parameters to t/b_arg relationship"""
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
plt.plot(b_arg, func(b_arg, *popt), 'r-',
         label='fit: a=%5.3f, b=%5.3f, c=%5.3f' % tuple(popt))
plt.show()
