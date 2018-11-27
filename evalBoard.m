function [red,yel] = evalBoard(board)
% this function checks the board for horozintal, vertical and
% diagonal combinations and returns back a large number if there
% are 4 pieces connected or a smaller number based on how many
% pieces each player has connected
yellowScore = 0;
redScore = 0;

rows = 6;
cols = 7;

for x = 1:rows
    for y = 1:cols
        %check horizontal rows
        if y + 3 <= cols
            %Counting red, yellow, empty for
            %each possible horizontal combination
            empty = 0; red = 0; yellow = 0;
            for z = 0:3
                if board(x, y+z) == 1
                    red = red +1;
                elseif board(x, y+z) == 2
                    yellow = yellow +1;
                else
                    empty = empty + 1;
                end
            end
           
            %check score
            %assign ranking based on # of pieces connected
            if yellow == 4
                yellowScore = yellowScore+1000;
            %if 3 horizontal    
            elseif yellow == 3 && empty == 1
                yellowScore = yellowScore + 10;
            %if 2 horizontal    
            elseif yellow == 2 && empty == 2
                yellowScore = yellowScore + 1;
            elseif red == 4
                redScore = redScore+1000;
            elseif red == 3 && empty == 1
                redScore = redScore + 10;
            elseif red == 2 && empty == 2
                redScore = redScore + 1;
            end
            
        end
        
        %counting diagonal right-down
        if x + 3 <= rows && y + 3 <= cols
            %Counting red,yellow,empty
            empty = 0; red = 0; yellow = 0;
            for z = 0:3
                if board(x+z, y+z) == 1
                    red = red +1;
                elseif board(x+z, y+z) == 2
                    yellow = yellow +1;
                else
                    empty = empty + 1;
                end
            end
            
             %check score
            if yellow == 4
                yellowScore = yellowScore+1000;
            elseif yellow == 3 && empty == 1
                yellowScore = yellowScore + 10;
            elseif yellow == 2 && empty == 2
                yellowScore = yellowScore + 1;
            elseif red == 4
                redScore = redScore+1000;
            elseif red == 3 && empty == 1
                redScore = redScore + 10;
            elseif red == 2 && empty == 2
                redScore = redScore + 1;
            end
            
        end
        
        %counting down
        if x + 3 <= rows
            %Counting red,yellow,empty
            empty = 0; red = 0; yellow = 0;
            for z = 0:3
                if board(x+z, y) == 1
                    red = red +1;
                elseif board(x+z, y) == 2
                    yellow = yellow +1;
                else
                    empty = empty + 1;
                end
            end
            
             %check score
            if yellow == 4
                yellowScore = yellowScore+1000;
            elseif yellow == 3 && empty == 1
                yellowScore = yellowScore + 10;
            elseif yellow == 2 && empty == 2
                yellowScore = yellowScore + 1;
            elseif red == 4
                redScore = redScore+1000;
            elseif red == 3 && empty == 1
                redScore = redScore + 10;
            elseif red == 2 && empty == 2
                redScore = redScore + 1;
            end
            
        end
        
        %counting diagonal left-down
        if x + 3 <= rows && y - 3 > 0
            %Counting red,yellow,empty
            empty = 0; red = 0; yellow = 0;
            for z = 0:3
                if board(x+z, y-z) == 1
                    red = red +1;
                elseif board(x+z, y-z) == 2
                    yellow = yellow +1;
                else
                    empty = empty + 1;
                end
            end
            
             %check score
            if yellow == 4
                yellowScore = yellowScore+1000;
            elseif yellow == 3 && empty == 1
                yellowScore = yellowScore + 10;
            elseif yellow == 2 && empty == 2
                yellowScore = yellowScore + 1;
            elseif red == 4
                redScore = redScore+1000;
            elseif red == 3 && empty == 1
                redScore = redScore + 10;
            elseif red == 2 && empty == 2
                redScore = redScore + 1;
            end
            
        end
        
    end
end

% if either of these are > 1000, game over, that player has won.
yel = yellowScore;
red = redScore;
end
                