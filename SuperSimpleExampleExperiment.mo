model SuperSimpleExampleExperiment "Use extremum seeker (ES) to set optimal speed for a simple model"
  annotation(experiment(StopTime = 500,Interval=10));
  
  UUV.Utilities.SuperSimpleExampleModel superSimpleExampleModel;

  UUV.Utilities.ExtremumSeeker ES(del=20000, 
                                  start_contVariable=0.10, 
                                  freq = 10, 
                                  HPfreq = 0.01, 
                                  LPfreq = 0.1, 
                                  a = 1e-1, 
                                  b = 1e-2);
  
equation
  //set what variable in the simple model the ES should use for control (control variable)
  superSimpleExampleModel.speedFluid = ES.contVariable;
  //set what variable in the simple model the ES should seek to minimise (objective value) 
  superSimpleExampleModel.consumptionRate = ES.objValue;

end SuperSimpleExampleExperiment;