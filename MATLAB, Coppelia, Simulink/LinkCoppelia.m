% MECA482 Ball and Plate 
% linking and running control system on CoppeliaSim
sim = remApi('remoteApi');
sim.simxFinish(-1);
clientID = sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1)
    disp('Connected to remote API server');
    set_param('CoppeliaSimulink','SimulationCommand','start')  
  j = [0,0];
  [r,h(1)] = sim.simxGetObjectHandle(clientID, 'RotateY0',sim.simx_opmode_blocking);
  [r,h(2)] = sim.simxGetObjectHandle(clientID, 'RotateX',sim.simx_opmode_blocking);
while true
    [res,retInts,retFloats,retStrings,retBuffer] =sim.simxCallScriptFunction(clientID,'Cam',...
     sim.sim_scripttype_childscript,'CoordCalc',[],[],[],[],sim.simx_opmode_blocking);
     xpos=retFloats(1);
     ypos=retFloats(2);
     r_x=xpos;
     set_param('CoppeliaSimulink/Constant','Value',num2str(r_x));
     pause(.01);
    
     r_y=ypos;
     set_param('CoppeliaSimulink/Constant1','Value',num2str(r_y));
     pause(.01);
     
     theta_x=get_param('CoppeliaSimulink/To Workspace','RuntimeObject');
     X= (theta_x.InputPort(1).Data * 10000);
     
     theta_y=get_param('ball_and_plate/To Workspace1','RuntimeObject');
     Y= (theta_y.InputPort(1).Data * 10000);
     
     sim.simxSetJointTargetPosition(clientID,h(2),X,sim.simx_opmode_streaming)
     sim.simxSetJointTargetPosition(clientID,h(1),Y,sim.simx_opmode_streaming)
end
else
      disp('Failed connecting to remote API server');
end
    coppelia.delete(); % call the destructor!
    
    disp('Program ended');