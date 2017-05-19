close all;
clear;
clc;


target=im2double(imread('frame73.jpg'));
reference1=im2double(imread('frame72.jpg'));
target2=im2double(imread('frame81.jpg'));


%question a
tic
[out88,sumf88]=SAD(target,reference1,8,8);
bestmatch88=(abs(target(:,:,1)-out88(:,:,1))+abs(target(:,:,2)-out88(:,:,2))+abs(target(:,:,3)-out88(:,:,3)));
toc
psnr88f=computerPSNR(target,out88);
figure

imwrite(bestmatch88,'a_fullsearch8x8.jpg');
imshow(bestmatch88);

[out816,sumf816]=SAD(target,reference1,8,16);
bestmatch816=(abs(target(:,:,1)-out816(:,:,1))+abs(target(:,:,2)-out816(:,:,2))+abs(target(:,:,3)-out816(:,:,3)));
psnr816f=computerPSNR(target,out816);
figure
imwrite(bestmatch816,'a_fullsearch8x16.jpg');
imshow(bestmatch816);
tic
[out168,sumf168]=SAD(target,reference1,16,8);
bestmatch168=(abs(target(:,:,1)-out168(:,:,1))+abs(target(:,:,2)-out168(:,:,2))+abs(target(:,:,3)-out168(:,:,3)));
toc
psnr168f=computerPSNR(target,out168);
figure
imwrite(bestmatch168,'a_fullsearch16x8.jpg');
imshow(bestmatch168);
[out1616,sumf1616]=SAD(target,reference1,16,16);
bestmatch1616=(abs(target(:,:,1)-out1616(:,:,1))+abs(target(:,:,2)-out1616(:,:,2))+abs(target(:,:,3)-out1616(:,:,3)));
psnr1616f=computerPSNR(target,out1616);
figure
imwrite(bestmatch1616,'a_fullsearch16x16.jpg');
imshow(bestmatch1616);

tic
[out88,sumd88]=D_log(target,reference1,8,8);
bestmatch88=(abs(target(:,:,1)-out88(:,:,1))+abs(target(:,:,2)-out88(:,:,2))+abs(target(:,:,3)-out88(:,:,3)));
toc
 psnr88d=computerPSNR(target,out88);
 figure
imwrite(bestmatch88,'a_2dlogsearch8x8.jpg');
 imshow(bestmatch88);
tic
[out168,sumd168]=D_log(target,reference1,16,8);
bestmatch168=(abs(target(:,:,1)-out168(:,:,1))+abs(target(:,:,2)-out168(:,:,2))+abs(target(:,:,3)-out168(:,:,3)));
toc
psnr168d=computerPSNR(target,out168);
figure
imwrite(bestmatch168,'a_2dlogsearch16x8.jpg');
imshow(bestmatch168);
[out816,sumd816]=D_log(target,reference1,8,16);
bestmatch816=(abs(target(:,:,1)-out816(:,:,1))+abs(target(:,:,2)-out816(:,:,2))+abs(target(:,:,3)-out816(:,:,3)));
psnr816d=computerPSNR(target,out816);
figure
imwrite(bestmatch816,'a_2dlogsearch8x16.jpg');
imshow(bestmatch816);
[out1616,sumd1616]=D_log(target,reference1,16,16);
bestmatch1616=(abs(target(:,:,1)-out1616(:,:,1))+abs(target(:,:,2)-out1616(:,:,2))+abs(target(:,:,3)-out1616(:,:,3)));
psnr1616d=computerPSNR(target,out1616);
figure
imwrite(bestmatch1616,'a_2dlogsearch16x16.jpg');
imshow(bestmatch1616);

%question b

[out882,sum2f88]=SAD(target2,reference1,8,8);
bestmatch88=(abs(target2(:,:,1)-out882(:,:,1))+abs(target2(:,:,2)-out882(:,:,2))+abs(target2(:,:,3)-out882(:,:,3)));
psnr88f2=computerPSNR(target2,out882);
figure
imwrite(bestmatch88,'b_fullsearch8x8.jpg');
imshow(bestmatch88);
[out816,sum2f816]=SAD(target2,reference1,8,16);
bestmatch816=(abs(target2(:,:,1)-out816(:,:,1))+abs(target2(:,:,2)-out816(:,:,2))+abs(target2(:,:,3)-out816(:,:,3)));
psnr816f2=computerPSNR(target2,out816);
figure
imwrite(bestmatch816,'b_fullsearch8x16.jpg');
imshow(bestmatch816);
[out168,sum2f168]=SAD(target2,reference1,16,8);
bestmatch168=(abs(target2(:,:,1)-out168(:,:,1))+abs(target2(:,:,2)-out168(:,:,2))+abs(target2(:,:,3)-out168(:,:,3)));
psnr168f2=computerPSNR(target2,out168);
figure
imwrite(bestmatch168,'b_fullsearch16x8.jpg');
imshow(bestmatch168);
[out1616,sum2f1616]=SAD(target2,reference1,16,16);
bestmatch1616=(abs(target2(:,:,1)-out1616(:,:,1))+abs(target2(:,:,2)-out1616(:,:,2))+abs(target2(:,:,3)-out1616(:,:,3)));
psnr1616f2=computerPSNR(target2,out1616);
figure
imwrite(bestmatch1616,'b_fullsearch16x16.jpg');
imshow(bestmatch1616);

 [out88,sum2d88]=D_log(target2,reference1,8,8);
 bestmatch88=(abs(target2(:,:,1)-out88(:,:,1))+abs(target2(:,:,2)-out88(:,:,2))+abs(target2(:,:,3)-out88(:,:,3)));
 psnr88d2=computerPSNR(target2,out88);
 figure
 imwrite(bestmatch88,'b_2dlogsearch8x8.jpg');
 imshow(bestmatch88);
[out168,sum2d168]=D_log(target2,reference1,16,8);
bestmatch168=(abs(target2(:,:,1)-out168(:,:,1))+abs(target2(:,:,2)-out168(:,:,2))+abs(target2(:,:,3)-out168(:,:,3)));
psnr168d2=computerPSNR(target2,out168);
figure
imwrite(bestmatch168,'b_2dlogsearch16x8.jpg');
imshow(bestmatch168);
[out816,sum2d816]=D_log(target2,reference1,8,16);
bestmatch816=(abs(target2(:,:,1)-out816(:,:,1))+abs(target2(:,:,2)-out816(:,:,2))+abs(target2(:,:,3)-out816(:,:,3)));
psnr816d2=computerPSNR(target2,out816);
figure
imwrite(bestmatch816,'b_2dlogsearch8x16.jpg');
imshow(bestmatch816);
[out1616,sum2d1616]=D_log(target2,reference1,16,16);
bestmatch1616=(abs(target2(:,:,1)-out1616(:,:,1))+abs(target2(:,:,2)-out1616(:,:,2))+abs(target2(:,:,3)-out1616(:,:,3)));
psnr1616d2=computerPSNR(target2,out1616);
figure
imwrite(bestmatch1616,'b_2dlogsearch16x16.jpg');
imshow(bestmatch1616);
