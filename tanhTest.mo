within UUV;

model tanhTest
  parameter Real t_switch = 1.0;
  parameter Real t_offset = 0.0;
  parameter Real switchVal = 4.0;

  Real x1, x2;
  Real y;

equation
  //switchVal = x2;
  x1 = time;
  x2 = 4;
  y = tanhSwitch(t_switch,t_offset,switchVal,x1-x2);
end tanhTest;
