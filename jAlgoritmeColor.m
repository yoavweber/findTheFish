
function result = jAlgoritmeColor(img)
 

rMin = 0;
rMax = 50;

gMin = 0;
gMax = 40;

bMin = 0;
bMax = 65;

binaryImg = zeros(size(img,1),size(img,2));


for y=1:size(img,1)
    for x=1:size(img,2)
        if(isInRange(img(y,x,1), rMin, rMax) && isInRange(img(y,x,2), gMin, gMax) && isInRange(img(y,x,3), bMin, bMax))
            binaryImg(y,x) = 1;
        end
        
    end
end


BW = binaryImg;
BW = imfill(BW,'holes');
binaryImg = bwareaopen(BW, 50);

% ----------------- object extraction ---------------------
BW=bwareafilt(binaryImg,15);
regions=regionprops(BW,'Image');

MaxNumberOfObjects = 15

% objects with a small size would not be acknowledged
ObjectTreshHold = 30

newStruct = {}
for k = 1 : MaxNumberOfObjects
    if (size(regions(k).Image,1) > ObjectTreshHold &&   (size(regions(k).Image,2) > ObjectTreshHold))
        newStruct{1,end + 1} = regions(k).Image
    end
end

% -------------------------------------------
maybeFishIndex = size(newStruct,2)

result = zeros(maybeFishIndex,4) 
for k = 1 : maybeFishIndex

    highestPixle = findHighestPixel(newStruct{maybeFishIndex});
    lowerstPixle = findLowestPixel(newStruct{maybeFishIndex});
    leftPixle = findLeftPixel(newStruct{maybeFishIndex});
    rightPixle = findRightPixel(newStruct{maybeFishIndex});

    result(maybeFishIndex,:) = [highestPixle lowerstPixle leftPixle rightPixle];
end


end


function result = isInRange(value, min, max) 
    result = false;
    if (min < value && value < max) 
        result = true;
    end 
end
