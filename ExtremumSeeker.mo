model ExtremumSeeker
  parameter Real pi = 3.1415926535 "pi";
  
  // Implementation of a single degree of freedom extremum seeker (ES) behaviour
  parameter Real freq   = 1.0              "[1/sec, Hz], frequency at which to oscillate";
  parameter Real HPfreq = 0.1*freq         "[1/sec, Hz], cutoff frequency for 1st order high pass filter";
  parameter Real LPfreq = 0.1*freq         "[1/sec, Hz], cutoff frequency for 1st order low pass filter";
  parameter Real del    = 1.0              "[], amplitude applied to integrator weighting";
  parameter Real a      = 1e-6             "[], amplitude applied to oscillator for bias offset";
  parameter Real b      = 1e-6             "[], amplitude applied to oscillator for convolution with input";
  parameter Real start_contVariable = 0.0  "[], what value to start the search from";

  input     Real objValue                                          "[?], The system dynamics and objective function's current measured output value";
  output    Real contVariable(start=start_contVariable,fixed=true) "[?], The next value for control input to the objective function and any system dynamics";
  output    Real lpcV(start=start_contVariable,fixed=true)         "[?], The low pass filtered value of the control input, this is NOT used within the ES itself";
  
            Real hpX               "[?], High pass filter output value";
            Real x                 "[?], Integrator output value";
            Real sinOmegaT         "[?], Oscillator value";
equation
  der(hpX) + 2*pi*HPfreq*hpX   = der(objValue);            //high pass filter to remove objValue mean level
  sinOmegaT                    = sin(2*pi*freq*time);      //oscillator
  der(x)                       = hpX*b*sinOmegaT;          //integration of the convolved oscillator and filtered objValue
  contVariable                 = -del*x + a*sinOmegaT;     //accrue the integrator output in addition to the excitation on the contVariable
  der(lpcV) + 2*pi*LPfreq*lpcV = 2*pi*LPfreq*contVariable; //This is NOT used in the ES.  It simply low pass filters the estimated contVariable
end ExtremumSeeker;