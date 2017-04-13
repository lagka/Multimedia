function [output,B]=DCT2(imag_in,k)
    %imag=imread(imag_in);
    imag=im2double(imag_in);
    %imag=rgb2gray(imag);
    [m,n]=size(imag);
    T=zeros(8,8);
    T=my_dctmtx(8);
    %mask=zeros(8,8);
    
    B=zeros(m,n);
    output=zeros(m,n);
    mask=zeros(8,8);
    mask(1:k,1:k)=1;   
    dct=@(block_struct)T*block_struct.data*T';
    B=blockproc(imag,[8 8],dct);
    B2=blockproc(B,[8 8],@(block_struct)mask.*block_struct.data);
    invdct=@(block_struct)T'*block_struct.data*T;
    output=blockproc(B2,[8 8],invdct);
 
end