function [idct,dct]=hw1_a(input,n)
    img=imread(input);
    img=im2double(img);
    [idct,dct]=DCT(img,n);
    idct=im2uint8(idct);
    psnr=computerPSNR(img,idct);
    disp(psnr);
    figure 
    imshow(dct);
    figure
    imshow(idct);

end

