function raphu_connect4()
% player is yellow, robot will play red
clc, clear, close all;

global ard;
arduinoInit( )
board = zeros(6,7);
board = updateBoard(board);
[redScore, yelScore] = evalBoard(board);

% while no one has won
while (redScore < 1000) && (yelScore < 1000)
    
    % player goes first
    disp("player turn")
    % update board after player has gone
    waitforbuttonpress
    disp("updating board")
    board = updateBoard(board);
    disp("board updated")
    disp(board);
    % this was required as the robot cannot turn
    % precisely enough for the pieces to fit in the board
    disp("insert red token into gripper")
    waitforbuttonpress
    % this closes the gripper to hold the token
    movArm(9);
    % function finds the best move and does it
    [redMove, score] = findMove(board);
    movArm(redMove);
    % back to starting position
    movArm(8);
    disp("updating board")
    % checks the score
    [redScore, yelScore] = evalBoard(board);
    disp("board updated")
end

% if statements to see who won
if (redScore > 1000)
    disp("red has won the game")
elseif (yelScore > 1000)
    disp ("yellow has won the game")
end

end