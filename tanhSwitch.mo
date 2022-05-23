within UUV;

function tanhSwitch
  input  Real a "amplitude of the switch";
  input  Real b "time duration of switch (-'ve for switching off, +'ve for switching on)";
  input  Real c "offset for switch ";
  input  Real x;
  // input  Real t "time to switch";
  output Real y;
algorithm
  y := (a/2)*(1+Modelica.Math.tanh(b*x+c/b)); //(10/(t-1))
end tanhSwitch;
