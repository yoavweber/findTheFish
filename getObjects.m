function newStruct = getObjects(bImg)
%make sure that the picture is inverted
BW=bwareafilt(bImg,15);
regions=regionprops(BW,'Image','BoundingBox');

MaxNumberOfObjects = 15;

% objects with a small size would not be acknowledged
ObjectTreshHold = 30;

newStruct = {};
for k = 1 : MaxNumberOfObjects
    if (size(regions(k).Image,1) > ObjectTreshHold &&   (size(regions(k).Image,2) > ObjectTreshHold))
        newStruct{1,end + 1} = regions(k).Image;
        newStruct{2,end + 1} = regions(k).BoundingBox;
    end
end


end

