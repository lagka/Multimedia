function output=near_neighbor(img,scale);
    %img=imread(input);
    img=im2double(img);
    [m,n,h]=size(img);
    scale=double(scale);
    m2=m*scale;
    n2=n*scale;
    s=scale;
    %disp(s);
    output=zeros(m2,n2);
    for i=1:m2
        for j=1:n2
            for k=1:h
                a=round(i/s+0.499999999);
                b=round(j/s+0.499999999);
               
                
                output(i,j,k)=img(a,b,k);
                
            end
        end
    end     
    
end