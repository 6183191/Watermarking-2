function [A] = limit(A)
[a,b,c]=size(A);
A=real(A);
for i=1:a
    for j=1:b
        for k=1:c
            if A(i,j,k)>255
                A(i,j,k)=255;
            end
            if A(i,j,k)<0
                A(i,j,k)=0;
            end
        end
    end
end
A=uint8(A);
end

