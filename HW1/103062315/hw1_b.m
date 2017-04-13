function [idct,yiq]=hw1_b(input,n)
    img=imread(input);
    yiq=YIQ(img);
    [idct_y,dct]=DCT(yiq,n);
    idct=IYIQ(idct_y);
    img=im2double(img);
    idct=im2uint8(idct);
    psnr=computerPSNR(img,idct);
    disp(psnr);
    figure 
    imshow(idct);
    figure 
    imshow(yiq);



end