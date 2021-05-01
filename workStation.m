filePath = "assets/Testing/" + "016001_GH030034.MP4.jpg";
img = imread(filePath);

algoResult = jAlgoritmeColor(img);
imshow(algoResult)


if(checkIfBlankImage(algoResult))
        result = 0;
else 
    possibleFishes = getObjects(algoResult); % get all objects in binary image
    algBoundingBox = getMostCorrectFish(possibleFishes); % finds the most correct fish and returns the bounding box
    answerBoundingBox = getAnswerCords(filename); % get the answer cords
    result = compareBoxes(algBoundingBox, answerBoundingBox, fishimage); % compare the result
end


showBoundingBox(img, algoResult, algBoundingBox)
result