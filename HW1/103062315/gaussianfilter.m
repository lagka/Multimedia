function output=gaussianfilter(img,s,sigma)
    %img=imread(input);
    img=im2double(img);
    G=fspecial('gaussian',[s s],sigma);
    [m,n]=size(img);
    p=zeros(s,s);
    m2=(s-1)/2;
    n2=(s-1)/2;
    output=zeros(m,n);
    for i=1:m
        for j=1:n       
           if (i-m2>0&&j-n2>0&&j+n2<=n&&i+m2<=m)
           p=img(i-m2:i+m2,j-n2:j+n2);    
           output(i,j)=output(i,j)+sum(sum(G.*p));
           else 
           output(i,j)=img(i,j);
           end
        end    
    end         
     % output=im2double(output);      
end