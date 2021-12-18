# MECA 482-Fall2021 Ball and Plate System
Group 6: Joseluis Zamora, Jesus Hernandez, Joseph Marlowe, Gerardo Munguia, Jacob Krainock 

## Introduction 
The control system design in this report will utilize a ball and plate system. A ball and plate system involves a ball that freely moves about a plate that will tilt due to two servor motors. These servor motors are oriented in two different angular orientations to achieve the desired range or motion. The requirements of the system are listed below:
- [ ] Balance a ball on the center of the plate
- [ ] React to system disburbances

## Mathematical Model
For deriving a mathematical the system in question is reduced to a simpler model to find the transfer function. For a ball and plate system it can be reduced to a ball on a beam system. Since the design of the ball and plate system will have identical in the x-y and ¬y-z plane only the x-y plane is modeled below in Figure 1.
![](Figures/mathmaticmodel.png) <br>
 **Figure 1**: Ball and Plate system free body diagram of a) the system and b) the ball. <br>
 
 
## Controller Design 
Conventional modern control theory uses the state space representation approach and is useful because criteria desired to a control system can be accomplished. One very important advantage to this theory is the ability to manipulate pole placement while incorporating full state feedback. The beauty of the state space representation is that it allows higher order systems to be modeled as several first order systems. However for this report we are using state space only to check for controllability and observability.  Because humans are spaciall thinkers that are limited, the rest of the control theory is handled by software that makes using state space representations easy. 
## Simulink

## Matlab and Coppelia


