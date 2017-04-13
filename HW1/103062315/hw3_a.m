src=imread('img_LR.png');

o=near_neighbor(src,4);
k=imread('img_HR.png');

pt=computerPSNR(k,o);
disp(pt);
figure 
imshow(o);