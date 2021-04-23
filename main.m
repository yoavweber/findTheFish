clc
clear all

filename = '015001_GH020034.MP4.jpg';

filePath = "assets/Testing/" + filename;
fishimage = imread(filePath);

dinfo = dir('assets/Testing/');
names_cell = {dinfo.name};


for i=1:2
    
    algoResult = algoritme1(fishimage);
    
    answerCords = getAnswerCords(filename);
    result = compareBoxes(algoResult, algoResult, fishimage);
    
end