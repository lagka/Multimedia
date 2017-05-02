function psnr=computerPSNR(input1_s,input2_s)
    %get size
    [m,n,k]=size(input1_s);
    %同轉成single
   input1_s=im2double(input1_s);
   input2_s=im2double(input2_s);
   MSER=1/(m*n)*sum(sum((input1_s(:,:,1)-input2_s(:,:,1)).^2));
   MSEG=1/(m*n)*sum(sum((input1_s(:,:,2)-input2_s(:,:,2)).^2));
   MSEB=1/(m*n)*sum(sum((input1_s(:,:,3)-input2_s(:,:,3)).^2));
   MSE=(MSER+MSEG+MSEB)/3;
   %代公式，公式中的f_peak在此處因為是single 所以f_peak=1
    psnr=10*log10(1/MSE);
end