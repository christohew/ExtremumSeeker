within UUV;

model SuperSimpleWithMassExampleExperiment "Use extremum seeker (ES) to set optimal speed for a simple model"
  annotation(experiment(StopTime = 500,Interval=10));
  
  UUV.SuperSimpleExampleModelWithMass superSimpleExampleModelWithMass(controlKP=100,controlKI=1.0);
  
  UUV.ExtremumSeeker ES(del=20000, 
                        start_contVariable=1.0, 
                        freq = 10, 
                        HPfreq = 0.01, 
                        LPfreq = 0.1, 
                        a = 1e-1, 
                        b = 1e-2);

equation
//test
  ES.contVariable = superSimpleExampleModelWithMass.speedFluidDemand;
  ES.objValue = superSimpleExampleModelWithMass.consumptionRate;
//  test.speedFluidDemand = 2.0;
//  if (time >= 200 and time < 300) then
//    test.speedFluidDemand = 2.0;
//  elseif (time >= 300 and time < 400) then
//    test.speedFluidDemand = 3.0;
//  else
//    test.speedFluidDemand = 1.0;
//  end if;
  
end SuperSimpleWithMassExampleExperiment;
