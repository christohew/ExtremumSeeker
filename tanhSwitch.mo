function tanhSwitch
  input  Real a "amplitude of the switch";
  input  Real b "time duration of switch (-'ve for switching off, +'ve for switching on)"
  input  Real c "offset for switch ";
  input  Real x;
  input  Real t; "time to switch"
  output Real y;
algorithm
  y = (a/2)*(1+Modelica.Math.tanh((10/(t-1))*x+c/b));
end tanhSwitch;

0.5 5.5
1   3
2   1.5
3   1
5   0.5
10  0.2


b = 10/(t-1)