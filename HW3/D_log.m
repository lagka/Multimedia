function [output,summa]=D_log(target,reference1,range,blocksize)
    [m,nn,z]=size(target);
    summa=0;
  
    ran=range;
    for i=1:blocksize:m
        for j=1:blocksize:nn
            min=realmax;
            min2=realmax;
         
            n_plum=floor(log2(ran));
            n=max(2,2^(n_plum-1));          
            n2=max(2,2^(n_plum-1));
            s=0;
            q=0;
            l=0;
            g=0;
            while g~=1
                if s==0 
                    M=[0,0;n,0;0,n;-n,0;0,-n];
                    M_plum=M;
                end
                r=1;
                for k=1:5
                    if i+q+M_plum(k,1)>0&&i+q+blocksize-1+M_plum(k,1)<=m&&j+l+M_plum(k,2)>0&&j+l+blocksize-1+M_plum(k,2)<=nn&&q+M_plum(k,1)>=-ran&&q+M_plum(k,1)<=ran&&l+M_plum(k,2)>=-ran&&l+M_plum(k,2)<=ran
                        f=sum(sum(sum(abs(target(i:i+blocksize-1,j:j+blocksize-1,:)-reference1(i+q+M_plum(k,1):i+q+blocksize-1+M_plum(k,1),j+l+M_plum(k,2):j+l+blocksize-1+M_plum(k,2),:))))); 
                        if f<min
                           min = f;
                           r=k;        
                        end      
                    end     
                end
                if r==1      
                    n=n/2;
                    if n==1
                        mins=realmax;
                        for a=-1:1
                            for b=-1:1
                                if i+q+a>0&&i+q+a+blocksize-1<=m&&j+b+l>0&&j+b+l+blocksize-1<=nn
                                    f=sum(sum(sum(abs(target(i:i+blocksize-1,j:j+blocksize-1,:)-reference1(i+q+a:i+a+q+blocksize-1,j+l+b:j+b+l+blocksize-1,:)))));
                                    if f<mins
                                       mins=f;
                                       min_i=i+q+a;
                                       min_j=j+b+l;
                                       g=1;
                                    end    
                                end     
                            end   
                        end
                    else
                        s=0;
                    end   
                else
                    c=M_plum(r,1);
                    d=M_plum(r,2);
                    if q+c>=-ran&&q+c<=ran&&l+d>=-ran&&l+d<=ran
                           q=q+c;
                           l=l+d;    
                    end
                    s=0;
                end 
            end
           
                output(i:i+blocksize-1,j:j+blocksize-1,:)=reference1(min_i:min_i+blocksize-1,min_j:min_j+blocksize-1,:);
                summa=summa+mins;
           
        end
    end
end