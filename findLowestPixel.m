function result = findLowestPixel(img)
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1)
                result = y;
            end
        end
    end
end