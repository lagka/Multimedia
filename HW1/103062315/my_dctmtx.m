function mtx=my_dctmtx(input)
    mtx=zeros(input,input);
    for i=1:input
        for j=1:input
          if i==1
                T(i,j)=1/sqrt(8);
            else
                T(i,j)=sqrt(2/8)*cos(pi*(2*j-1)*(i-1)/16);
          end        
        end
    end
    mtx=T;
end    