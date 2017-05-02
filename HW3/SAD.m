function [output,summa] = SAD(target,reference,range,blocksize)
    
    t=0;
    summa=0;
    [m,n,z]=size(target);
    output=zeros(m,n,z);
    for a=1:blocksize:m
        for b=1:blocksize:n
            t=t+1;
           minv=9999999;
            for i=-range:range
                for j= -range:range                   
                    if a+i>0&&a+i+blocksize-1<=m&&b+j>0&&b+j+blocksize-1<=n                     
                        k=a+i;                                   
                        l=b+j;   
                        f=sum(sum(sum(abs(target(a:a+blocksize-1,b:b+blocksize-1,:)-reference(k:k+blocksize-1,l:l+blocksize-1,:)))));
                        if f<minv
                            minv=f;
                            min_i=k;
                            min_j=l;
                        end    
                    else continue; 
                    end    
                end    
            end  
            output(a:a+blocksize-1,b:b+blocksize-1,:)=reference(min_i:min_i+blocksize-1,min_j:min_j+blocksize-1,:);
           summa=summa+minv;
        end
    end    
end