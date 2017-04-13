src=imread('img_LR.png');

o=bilinear(src,4);

k=imread('img_HR.png');
k=im2double(k);
pt=computerPSNR(k,o);
disp(pt);
figure 
imshow(o);