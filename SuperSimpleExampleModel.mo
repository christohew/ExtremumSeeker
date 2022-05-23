within UUV;

model SuperSimpleExampleModel
  
  parameter Real    rho              =1.0;
  parameter Real    A                =1.0;
  parameter Real    C                =1.0;
  parameter Real    eff_prop         =0.5;
  parameter Real    eff_conv         =0.5;
  parameter Real    fuelEnergyDensity=1000;
  parameter Real    fuelFill         =1000;
  
            Integer propulsionStatus(start=1,fixed=true);
  
  input     Real    speedFluid;
  output    Real    consumptionRate;
  
            Real    powerDemandFixed;
            Real    powerDemandProp;
            Real    dragForce;
            Real    powerDemand;
            Real    fuel(start=fuelFill,fixed=true);
            Real    travel(start=0.0,fixed=true);  

equation
  der(travel)                          = speedFluid*propulsionStatus;
  eff_prop*powerDemandProp             = speedFluid*dragForce;
  dragForce                            = 0.5*rho*A*C*speedFluid^2;
  powerDemand                          = powerDemandProp + powerDemandFixed;
  eff_conv*fuelEnergyDensity*der(fuel) = -powerDemand;
  consumptionRate                      = -der(fuel)/speedFluid;
  when(fuel<=0.0) then
    propulsionStatus = 0;
  end when;
  if(travel > 500 and travel < 1000) then
    powerDemandFixed = 100.0;
  else
    powerDemandFixed = 10.0;
  end if;
  
end SuperSimpleExampleModel;
