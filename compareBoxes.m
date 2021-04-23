function cords = compareBoxes(cords, cords2, binaryImage)

top2 = cords2(1);
low2 = cords2(2);
left2 = cords2(3);
right2 = cords2(4);


width2 = right2-left2;
height2 = low2-top2;

top = cords(1);
low = cords(2);
left = cords(3);
right = cords(4);

width = right-left;
height = low-top;

resultBox = [left, top, width, height]
answerBox = [left2, top2, width2, height2]
 
%%
figure,imshow(binaryImage);
hold on;
rectangle('Position',[left, top, width, height],'EdgeColor','r','LineWidth',2);
rectangle('Position',[left2, top2, width2, height2],'EdgeColor','g','LineWidth',2);

%%

intersectionArea = rectint(resultBox, answerBox); %If you don't have this function then write a simple one for yourself which calculates area of intersection of two rectangles.
unionArea = (width2*height2)+(width*height)-intersectionArea;
overlapArea = intersectionArea/unionArea;




end