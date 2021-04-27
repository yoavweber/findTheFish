clc
clear all

%filename = '015001_GH020034.MP4.jpg';
dinfo = dir('assets/Testing/*.jpg');
names_cell = {dinfo.name};

allResults = []; % array with all results

%size(names_cell,2)
for i=10:12
    % get an image from the test set
    filename = names_cell{i};
    filePath = "assets/Testing/" + filename;
    fishimage = imread(filePath);
    
    algoResult = jAlgoritmeColor(fishimage); % algoritme to create binary image
    
    if(checkIfBlankImage(algoResult))
        result = 0;
    else 
        possibleFishes = getObjects(algoResult); % get all objects in binary image
        algBoundingBox = getMostCorrectFish(possibleFishes); % finds the most correct fish and returns the bounding box
        answerBoundingBox = getAnswerCords(filename); % get the answer cords
        result = compareBoxes(algBoundingBox, answerBoundingBox, fishimage); % compare the result
    end
    

    allResults(end+1) = result; %save the result
    %showBoundingBox(fishimage, algoResult, algBoundingBox)
end

% prints the results
allResults
