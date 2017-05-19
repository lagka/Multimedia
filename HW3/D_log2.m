function [output,summa]=D_log2(target,reference1,reference2,range,blocksize)
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
                    if i+q+M_plum(k,1)>0&&i+q+blocksize-1+M_plum(k,1)<=m&&j+l+M_plum(k,2)>0&&j+l+blocksize-1+M_plum(k,2)<=nn
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
                    q=q+c;
                    l=l+d;                   
                    s=0;
                end 
            end
            s2=0;
            q2=0;
            l2=0;
            g2=0;
            while g2~=1
                if s2==0 
                    M2=[0,0;n2,0;0,n2;-n2,0;0,-n2];
                    M_plum2=M2;
                end
                r2=1;
                for k2=1:5
                    if i+q2+M_plum2(k2,1)>0&&i+q2+blocksize-1+M_plum2(k2,1)<=m&&j+l+M_plum2(k2,2)>0&&j+l2+blocksize-1+M_plum2(k2,2)<=nn
                        f2=sum(sum(sum(abs(target(i:i+blocksize-1,j:j+blocksize-1,:)-reference2(i+q2+M_plum2(k2,1):i+q2+blocksize-1+M_plum2(k2,1),j+l2+M_plum2(k2,2):j+l2+blocksize-1+M_plum2(k2,2),:))))); 
                        if f2<min2
                           min2 = f2;
                           r2=k2;        
                        end      
                    end     
                end
                if r2==1      
                    n2=n2/2;
                    if n2==1
                        mins2=realmax;
                        for a=-1:1
                            for b=-1:1
                                if i+q2+a>0&&i+q2+a+blocksize-1<=m&&j+b+l2>0&&j+b+l2+blocksize-1<=nn
                                    f2=sum(sum(sum(abs(target(i:i+blocksize-1,j:j+blocksize-1,:)-reference2(i+q2+a:i+a+q2+blocksize-1,j+l2+b:j+b+l2+blocksize-1,:)))));
                                    if f2<mins2
                                       mins2=f2;
                                       min_i2=i+q2+a;
                                       min_j2=j+b+l2;
                                       g2=1;
                                    end    
                                end     
                            end   
                        end
                    else
                        s2=0;
                    end   
                else
                    c2=M_plum2(r2,1);
                    d2=M_plum2(r2,2);
                    q2=q2+c2;
                    l2=l2+d2;                   
                    s2=0;
                end 
            end
            if mins<mins2
                output(i:i+blocksize-1,j:j+blocksize-1,:)=reference1(min_i:min_i+blocksize-1,min_j:min_j+blocksize-1,:);
                summa=summa+mins;
            else
                output(i:i+blocksize-1,j:j+blocksize-1,:)=reference2(min_i2:min_i2+blocksize-1,min_j2:min_j2+blocksize-1,:);
                summa=summa+mins2;
            end    
        end
    end
end