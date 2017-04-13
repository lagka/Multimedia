src=imread('thinker_gray_noised.jpg');

    o=medianfilter(src,3);
    o2=medianfilter(src,9);
    figure 
    imshow(o);
    figure
    imshow(o2);