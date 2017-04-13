function output=medianfilter(img,s)
    %img=imread(input);
    img=im2double(img);
    [m,n]=size(img);
    m2=(s-1)/2;
    n2=(s-1)/2;
    output=zeros(m,n);
    index=0;
    for i=1:m
        for j=1:n
            if i-m2>0&&j-n2>0&&i+m2<=m&&j+n2<=n
                p=img(i-m2:i+m2,j-n2:j+n2);
                p=reshape(p,[s*s,1]);
                output(i,j)=median(p);
            else
                output(i,j)=img(i,j);
                index=index+1;
                disp(index);
            end    
        end    
    end
end