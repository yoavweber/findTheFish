function result = aAlgorithmGray(img)
I = rgb2gray(img);

H = imhist(I);
[M,Bval] = max(H);

IB = 155 - Bval;
if Bval>100
  IB = IB + 25;
end
x=IB/255;

BW = imbinarize(I,x);

BW=bwareaopen(BW, 100);
binaryImg = imcomplement(BW);
binaryImg=bwareaopen(binaryImg, 5000);

highestPixle = findHighestPixel(binaryImg);
lowerstPixle = findLowestPixel(binaryImg);
leftPixle = findLeftPixel(binaryImg);
rightPixle = findRightPixel(binaryImg);

result = [highestPixle lowerstPixle leftPixle rightPixle];

end



