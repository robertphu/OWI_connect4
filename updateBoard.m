function board = updateBoard(boardTemp)
% This function updates the board array using a current snapshot
% from the webcam

cam = webcam;
data = snapshot(cam);
clear cam;
imwrite(data,'data.jpg');

boardTemp = zeros(6,7);

figure(1);
imshow(data);
% The redMask and yelMask files are created with the Color
% Thresholder app. These files needed to be changed constantly
% due to diffrent lighting in my room at diffrent times.
figure(2);
[redBin redOnly] = redMask(data);
subplot(2, 2, 1);
imshow(redOnly);
title('Red Objects', 'FontSize', 16);
subplot(2, 2, 2)
[yellowBin yellowOnly] = yelMask(data);
imshow(yellowOnly);
% % Remove all those pixels less than 100px
redBin = bwareaopen(redBin,100);
yellowBin = bwareaopen(yellowBin,100);
% % Image blob analysis.
rstats = regionprops(redBin, 'BoundingBox', 'Centroid');
ystats = regionprops(yellowBin, 'BoundingBox', 'Centroid');
subplot(2, 2, 3);
imshow(redBin);
title('Red Objects', 'FontSize', 16);
hold on    
    %This is a loop to bound the red objects in a rectangular box.
    for object = 1:length(rstats)
        bb = rstats(object).BoundingBox;
        bc = rstats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        b=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(b, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
    end    
hold off

subplot(2, 2, 4)
imshow(yellowBin);
title('Yellow Objects', 'FontSize', 16);
hold on    
    %This is a loop to bound the yellow objects in a rectangular box.
    for object = 1:length(ystats)
        bb = ystats(object).BoundingBox;
        bc = ystats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        b=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(b, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
    end    
hold off

% Update virtual board

% Centroid of spaces in on the board
% using my camrea resoultion and board placement
boardCol = [125,188,255,323,389,457,525];
boardRow = [45, 106, 164, 222, 281, 341];
% Giving some error for the locations in the image
bound = 20;
boardColUpper = boardCol+bound;
boardColLower = boardCol-bound;
boardRowUpper = boardRow+bound;
boardRowLower = boardRow-bound;

% if centroid is found within the boundaries, a 1 (red) or 2 yellow)
% will be placed in the corresponding matrix board
for row = 1:6
    for col = 1:7
        for x = 1:length(ystats)
            bc = ystats(x).Centroid;
            if(inRange(bc(1), boardColLower(col), boardColUpper(col)) &&...
                    (inRange(bc(2), boardRowLower(row), boardRowUpper(row))))
                boardTemp(row,col) = 2;
            end
        end
        for x = 1:length(rstats)
            bc = rstats(x).Centroid;
            if(inRange(bc(1), boardColLower(col), boardColUpper(col)) &&...
                    (inRange(bc(2), boardRowLower(row), boardRowUpper(row))))
                boardTemp(row,col) = 1;
            end
        end
    end
end
% disp(boardTemp);
board = boardTemp;
end