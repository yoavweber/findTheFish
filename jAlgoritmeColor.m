
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

result = binaryImg;

end

function result = isInRange(value, min, max) 
    result = false;
    if (min < value && value < max) 
        result = true;
    end 
end
