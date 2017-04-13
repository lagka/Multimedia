function output=IYIQ(input)

    Y=[0.299,0.587,0.114;0.596,-0.275,-0.321;0.212,-0.523,0.311];
    [m,n,k]=size(input);
    input=im2double(input);
    s=zeros(3:1);
    for i=1:m
        for j=1:n
            s(1,1)=input(i,j,1);
            s(2,1)=input(i,j,2);
            s(3,1)=input(i,j,3);
            output(i,j,:)=inv(Y)*s;
        end
    end 
 
end