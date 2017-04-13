function [result,b]=DCT(imag,n)
    %imag=imread(imag_in);
    imag=im2double(imag);
    [result(:,:,1),b(:,:,1)]=DCT2(imag(:,:,1),n);
    [result(:,:,2),b(:,:,2)]=DCT2(imag(:,:,2),n);
    [result(:,:,3),b(:,:,3)]=DCT2(imag(:,:,3),n);
    
end