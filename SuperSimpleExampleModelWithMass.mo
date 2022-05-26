within UUV;

model SuperSimpleExampleModelWithMass
  
  parameter Real    rho              =1000;
  parameter Real    A                =1.0;
  parameter Real    C                =1.0;
  parameter Real    eff_prop         =0.5;
  parameter Real    eff_conv         =0.5;
  parameter Real    fuelEnergyDensity=1000;
  parameter Real    fuelFill         =1000;
  parameter Real    mass             =36.0;
  parameter Real    controlKP        =10.0;
  parameter Real    controlKI        =100.0;
  
            Integer propulsionStatus(start=1,fixed=true);
  
  input     Real    speedFluidDemand;
  output    Real    consumptionRate;
  
            Real    speedFluid;//this is allowed to vary (internal state)...note this is NOT really inertial speed
            Real    propulsionForce;
            Real    x;
            Real    powerDemandFixed;
            Real    powerDemandProp;
            Real    dragForce;
            Real    powerDemand;
            Real    fuel(start=fuelFill,fixed=true);
            Real    travel(start=0.0,fixed=true);  

equation
//  if speedFluid > speedFluidDemand then
//    controlKI = 0.1;
//  else
//    controlKI = 1.0;
//  end if;
  propulsionForce = tanhSwitch(1.0, 0.0, controlKP*(speedFluidDemand-speedFluid)+controlKI*x, 100*(speedFluidDemand-speedFluid)); //scaling the trigger reduces the effect of tanhSwitch when controller is approaching speedFluidDemand
  der(x) = (speedFluidDemand-speedFluid);

  der(speedFluid)*mass                 = propulsionForce-dragForce;
  der(travel)                          = speedFluid*propulsionStatus;
  eff_prop*powerDemandProp             = speedFluid*propulsionForce;
  dragForce                            = 0.5*rho*A*C*speedFluid^2;
  powerDemand                          = powerDemandProp + powerDemandFixed;
  eff_conv*fuelEnergyDensity*der(fuel) = -powerDemand;
  consumptionRate                      = -der(fuel)/max(speedFluid,0.01);
  when(fuel<=0.0) then
    propulsionStatus = 0;
  end when;
  
  if(travel > 2000 and travel < 2500) then
    powerDemandFixed = 100.0;
  else
    powerDemandFixed = 10.0;
  end if;
  
end SuperSimpleExampleModelWithMass;
