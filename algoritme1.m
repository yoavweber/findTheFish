
function result = algoritme1(img)


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
% imshowpair(binaryImg,BW2,'montage')
binaryImg = bwareaopen(BW, 50);


highestPixle = findHighestPixel(binaryImg);
lowerstPixle = findLowestPixel(binaryImg);
leftPixle = findLeftPixel(binaryImg);
rightPixle = findRightPixel(binaryImg);

result = [highestPixle lowerstPixle leftPixle rightPixle];

end


function result = isInRange(value, min, max) 
    result = false;
    if (min < value && value < max) 
        result = true;
    end 
end