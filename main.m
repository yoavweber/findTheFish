clc
clear all

%filename = '015001_GH020034.MP4.jpg';


dinfo = dir('assets/Testing/*.jpg');
names_cell = {dinfo.name};

allResults = []; % array with all results

for i=1:size(names_cell,2)
    % get an image from the test set
    filename = names_cell{i};
    filePath = "assets/Testing/" + filename;
    fishimage = imread(filePath);
    
    % get the corder box and compare it with the answer borderbox
    algoResult = jAlgoritmeColor(fishimage);
    answerCords = getAnswerCords(filename);
    result = compareBoxes(algoResult, answerCords, fishimage);
    allResults(end+1) = result;
end

allResults
