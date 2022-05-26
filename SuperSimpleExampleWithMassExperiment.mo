within UUV;

model SuperSimpleExampleWithMassExperiment "Use extremum seeker (ES) to set optimal speed for a simple model"
  UUV.SuperSimpleExampleModelWithMass superSimpleExampleModelWithMass;
  UUV.ExtremumSeeker ES(del = 2000, start_contVariable = 1.5, freq = 10, HPfreq = 0.01, LPfreq = 0.1, a = 1e-1, b = 1e-2);
equation
//set what variable in the simple model the ES should use for control (control variable)
  superSimpleExampleModelWithMass.speedFluidDemand = 4.0;
//set what variable in the simple model the ES should seek to minimise (objective value)
  superSimpleExampleModelWithMass.consumptionRate = ES.objValue;
  
//  if (time >= 200 and time < 300) then
//    superSimpleExampleModelWithMass.speedFluidDemand = 2.0;
//  elseif (time >= 300 and time < 400) then
//    superSimpleExampleModelWithMass.speedFluidDemand = 3.0;
//  else
//    superSimpleExampleModelWithMass.speedFluidDemand = 1.0;
//  end if;
  annotation(
    experiment(StopTime = 500, Interval = 10));
end SuperSimpleExampleWithMassExperiment;