within UUV;

function tanhSwitch
  input  Real t_switch  "request time taken to switch from off/on (make t_switch -'ve for on/off)";
  input  Real t_offset  "request time to offset switch activation after x occuring (make t_offset -'ve for activation before x)";
  input  Real switchVal "amplitude of the switch signal";
  input  Real x;
  output Real y;

protected
         //the following parameters t_a, t_b, t_c are used to convert a t_switch (time to switch from 1 to 0) 
         //to the parameter b used in the tanh function. The parameters were derived in the tanhVal.py script
         Real t_a := 5.29236488e+00 "";
         Real t_b := 1.94567629e-05 "";
         Real t_c := 5.28177726e-05 "";
         Real b   := t_a/(t_switch-t_c) + t_b "";
         
algorithm
  y := (switchVal/2)*(1+Modelica.Math.tanh(b*x-b*t_offset));
end tanhSwitch;
