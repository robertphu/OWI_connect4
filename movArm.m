function movArm(move)
% simple function to move robotic arm to
% a certain column. 1-7 are each # column
% 8 is default starting position
% 9 is just to close the gripper

% planning on adding M5, but the reading varies
% too much for the robot to play accurately

if move == 1    
    movM3to(517);
    movM4to(780);
    movM1to(712);    
elseif move == 2
    movM3to(440);
    movM4to(720);
    movM1to(712);
elseif move == 3    
    movM3to(390);
    movM4to(670);
    movM1to(712);
elseif move == 4
    movM3to(326);
    movM4to(617);
    movM1to(712);
elseif move == 5
    movM3to(295);
    movM4to(583);
    movM1to(712);
elseif move == 6
    movM3to(245);
    movM4to(520);
    movM1to(712);
elseif move == 7
    movM3to(200);
    movM4to(470);
    movM1to(712);
elseif move == 8
    movM4to(420);
    movM3to(200);
    movM1to(712);
elseif move == 9
    movM1to(760);
end