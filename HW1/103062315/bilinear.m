function output=bilinear(img,scale)

   % img=imread(input);
    img=im2double(img);
    [m,n,h]=size(img);
    m2=m*scale;
    n2=n*scale;
    output=zeros(m2,n2,3);
    for i=1:m2
        x=(i-0.5)/scale+0.5;  
        for j=1:n2
            y=(j-0.5)/scale+0.5;
            for k=1:h
                a=floor(x);
                b=floor(y);
                c=ceil(x);
                d=ceil(y);
                if a==0
                    a=1;
                end
                if c>=m
                    c=m;
                end 
                if d>=n
                    d=n;
                end  
                if b==0
                    b=1;
                end     
                da=double(x-a);
                db=double(y-b);
                output(i,j,k)=img(a,b,k)*(1-da)*(1-db)+img(c,b,k)*da*(1-db)+img(a,d,k)*(1-da)*db+img(c,d,k)*da*db;
            end
        end
    end
end