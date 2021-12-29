function i=Pre_processing(Img)
%apply median filter with mask 3x3 to reduce noise 
%apply image algebra 


%S = sort((Img(:)));

%offset = sum(S(1:15))/15;

i=rgb2gray(Img);

i = medfilt2(i, [3 3]);

%i=i-offset;

figure('Name','Image After Processing'),imshow(i);
end