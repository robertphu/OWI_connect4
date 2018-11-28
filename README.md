# OWI_connect4
Written in MATLAB R2018b
ECE 5397 Intro to Robotics Final Spring 2018

The OWI Robotic arm is controlled with an Arduino MEGA and has potentiometers attached to (almost) every joint to measure it's current position.

While Connect 4 is a mathematically solved game, the current code as of Fall 2018 only predicts one move ahead, so the AI of this robotic player isn't that great. If I have time I may look into how to program smarter undefeatable version later on. 

The original idea was to have the arm swing around on its base to collect the tokens from a designated spot, however the Connect 4 board required the gripper holding the tokens to be precisely aligned, and the voltage readings from the potentiometers varied too much for that. Another problem that arose is that I could not use my M3 potetiometer/motor for this project since it ended up falling off the robot after a semester of abuse.

Some example videos (as of Fall 2018):
* [Short demo video](https://youtu.be/z_uBRQgi_jQ)
* [Longer normal speed game](https://youtu.be/t3T1_jiAGIA)

Example photo processing:
![ex0](https://github.com/robertphu/OWI_connect4/blob/master/color%20detection%20example%202.PNG)
![ex1](https://github.com/robertphu/OWI_connect4/blob/master/color%20detection%20example%201.PNG)
![ex2](https://github.com/robertphu/OWI_connect4/blob/master/color%20to%20digital%20board.PNG)
