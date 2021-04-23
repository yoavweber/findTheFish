function result = findHighestPixel(img)
    result = -1;
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1 && result < 0)
                result = y;
            end
        end
    end
end