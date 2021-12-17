% MECA 482 Ball on Plate system
% root  locus application
%% Transfer Function
close all
clc
mb = 0.0674; %kg
rb = 0.0127; %m 
g = -9.81; %m/s^2
ds = 0.014; %m (servo)
Lpx = 0.115; % m
Lpz = 0.205; % m
Ib = (2/5)*mb*(rb)^2; %solid ball
s = tf('s');
TF = -g*mb*ds/Lpx/(Ib/rb^2+mb)/s^2
%% State-state respresentation
% H = -mb*g/(Ib/(rb^2)+mb);
% A = [0 1 0 0 
%     0 0 H 0 
%     0 0 0 1
%     0 0 0 0];
% B = [ 0 0 0 1]';
% C = [1 0 0 0];
% D = [0];
% Qc = [ B A*B (A^2*B) (A^3*B)];
% Qo = [ C C*A (C*A^2) (C*A^3)];
% ball_ss = ss(A,B,C,D)
%% Pole/Zero map & Step Response

figure(1)
pzmap(TF)

figure(2)
step(TF)

%% Closed-loop Control PID
%Proportional-Derivative Control
% Kp = 15;  % proportional
% Kd = 25; % derivative 
% C = pid(Kp,0,Kd);
% sys_cl = feedback(C*TF,1);
% figure(3)
% t = 0:0.01:5;
% step(0.25*sys_cl)
%% Root locus method
% settling time under 4s 
% OS% under 5%
figure(4)
rlocus(TF)% shows poles of system
sgrid(0.69,1.44)% damping & natural fequency calculated
axis([-5 5 -1.5 1.5]) % set axis limits

z = 0.01; % desired zero at 0.01
p = 5;    % desired pole at 5
C = tf([1 z], [1 p]); 
figure(5);
rlocus(C*TF) 
sgrid(0.69,1.44) 
axis([-5 5 -1.5 1.5])
[k,poles]=rlocfind(C*TF) % used to find gain value
sys_cl = feedback(8.5079*C*TF,1);
figure(6)
t = 0:0.01:5;
step(0.25*sys_cl,t)