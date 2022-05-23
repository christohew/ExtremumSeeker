within UUV;

model tanhTest
  parameter Real a = 1.0;
  parameter Real b = 1.0;
  parameter Real c = 0.0;

  Real x1, x2;
  Real y;

equation
  x1 = time;
  x2 = 4;
  y = tanhSwitch(a,b,c,x1-x2);
end tanhTest;
