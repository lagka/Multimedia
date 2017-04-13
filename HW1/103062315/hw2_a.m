src=imread('thinker_gray_noised.jpg');

    o=gaussianfilter(src,3,0.3);
    o2=gaussianfilter(src,9,1);
    figure 
    imshow(o);
    figure
    imshow(o2);