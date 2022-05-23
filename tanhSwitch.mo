within UUV;

function tanhSwitch
  input  Real t_switch  "request time between switch on/off";
  input  Real t_offset  "request time before triggering switch";
  input  Real switchVal "amplitude of the switch signal";
  input  Real x;
  output Real y;

protected
         Real t_a := 5.29236488e+00 "";
         Real t_b := 1.94567629e-05 "";
         Real t_c := 5.28177726e-05 "";
         Real b   := t_a/(t_switch-t_c) + t_b"";
         
algorithm
//  t_switch := t_a/(b-t_b) + t_c;
  y := (switchVal/2)*(1+Modelica.Math.tanh(b*x-b*t_offset));
end tanhSwitch;
