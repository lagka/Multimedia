close all;
clear;
clc;

target=im2double(imread('frame81.jpg'));
reference1=im2double((imread('frame72.jpg')));
reference2=im2double(imread('frame85.jpg'));
[out88,sumf88]=D_log2(target,reference1,reference2,8,8);
bestmatch88=(abs(target(:,:,1)-out88(:,:,1))+abs(target(:,:,2)-out88(:,:,2))+abs(target(:,:,3)-out88(:,:,3)));
psnr88f=computerPSNR(target,out88);
figure
imwrite(bestmatch88,'2dlogsearch_bi8x8.jpg');
imshow(bestmatch88);
