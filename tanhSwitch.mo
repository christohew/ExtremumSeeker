function tanhSwitch
  input  Real x;
  input  Real t_switch  "request time between switch on/off";
  input  Real t_offset  "request time before triggering switch";
  input  Real switchVal "amplitude of the switch signal";
  output Real y;

protected
         Real t_a := 5.29236488e+00 "";
         Real t_b := 1.94567629e-05 "";
         Real t_c := 5.28177726e-05 "";
         Real b "";
         t_switch := t_a/(b-t_b) + t_c

algorithm
  y = (switchVal/2)*(1+Modelica.Math.tanh(b*x+t_offset/b)) + (switchVal/2);
end tanhSwitch;
