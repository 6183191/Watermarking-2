function [output] = reconstructing(origin,embedded,mark,a)

[m,n]=size(origin);
mark=imresize(mark,[m/2,n/2]);
[X1,X2,X3,X4]=dwt2(embedded,'haar');
[Y1,Y2,Y3,Y4]=dwt2(origin,'haar');

[U,A,V]=svd(double(mark));

[U1,A1,V1]=svd(X1);
[U2,A2,V2]=svd(Y1);
X1=U*(A1-A2)/a*V';

% [U1,A1,V1]=svd(X2);
% [U2,A2,V2]=svd(Y2);
% X2=U*(A1-A2)/a*V';
% 
% [U1,A1,V1]=svd(X3);
% [U2,A2,V2]=svd(Y3);
% X3=U*(A1-A2)/a*V';
% 
% [U1,A1,V1]=svd(X4);
% [U2,A2,V2]=svd(Y4);
% X4=U*(A1-A2)/a*V';

output=X1;
end

