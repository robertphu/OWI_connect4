function [bestMove , bestScore] = findMove(board)
% finds the best move for red (player 1)
    
        bestMove = 1;
    bestScore = -9999;
    % red is player1, yellow player2    
    first = 1;
    second = 2;
    % array to store evalBoard to find next best move
    firstScores = zeros(1,7);
    secondScores = zeros(1,7);
    
    % for columns 1:7
    % evaulates the board and possible moves to find 
    % highest ranking evalBoard() move
    for x = 1:7

        %reset first board
        firstBoard = board;

        %if top row is full, cannot move there
        %goto next row
        if board(1,x) ~= 0
            continue;
        end

        %insert red in first open row in column x
        for z = 1:6
            if z + 1 >= 7 || board(z+1,x) ~= 0
                firstBoard(z,x) = first;
                break;
            end
        end
        
        %evaulate if move is better for red
        [temp1, temp2] = evalBoard(firstBoard);
        temp = temp1 - temp2;
        
        %if red score is 1000, winning move
        %place piece there and skip checking enemy move
        if temp >= 1000
            bestScore = temp;
            bestMove = x;
            break
        end

        
        %checking second (enemy) yellow move
        for y = 1:7

            %reset second board
            secondBoard = firstBoard;

            %insert yellow assuming previous red move
            for z = 1:6
                if z+1 >=7 || firstBoard(z+1,y) ~= 0
                    secondBoard(z,y) = second;
                    break;
                end
            end

            %calc score for enemy (yellow) move
            [score1, score2] = evalBoard(secondBoard);
            secondScores(y) = score1 - score2;
            %if yellow is about to win, score2 >> score 1
            %so secondScores will be about -1000

        end

        %calc min score from second move
        firstScores(x) = min(secondScores);
    end
        %if no winning move found, this loops calculates best
        %move based on evalBoard to connect the most pieces together
    if bestScore < 1000
        bestScore = firstScores(1);
        for x = 2:7
            if firstScores(x) > bestScore
                bestScore = firstScores(x);
                bestMove = x;
            end
        end
    end
    
end

