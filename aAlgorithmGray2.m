function result = aAlgorithmGray2(img)
I = rgb2gray(img);

%H = imhist(I);
%[~,Bval] = max(H);

%IB = 155 - Bval;
%if Bval>100
%  IB = IB + 25;
%end
gMax=50;

x=gMax/255;

BW = imbinarize(I,x);

%[counts,~] = imhist(BW);
%S=counts(1)/(sum(counts)/100);
%while S>10
%    if S>20
%        x=x-0.01*(S-10)/5; %for speed
%    end
%    x=x-0.01;
%    BW = imbinarize(I,x);
%    [counts,~] = imhist(BW);
%    S=counts(1)/(sum(counts)/100);
%end

BW = imfill(BW,'holes');
binaryImg=bwareaopen(BW, 50);
%binaryImg = imcomplement(BW);
%binaryImg=bwareaopen(binaryImg, 5000);


result = binaryImg;

end



