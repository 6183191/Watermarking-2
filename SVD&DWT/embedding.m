function [W_] = embedding(C,W,a)

[m,n]=size(C);
L=zeros(4,m/2,n/2);

[L(1,:,:),L(2,:,:),L(3,:,:),L(4,:,:)]=dwt2(C,'haar');
V=zeros(4,m/2,n/2);
U=zeros(4,m/2,n/2);
A=zeros(4,m/2,n/2);
for i=1:4
    X=reshape(L(i,:,:),m/2,n/2);
    [Y,Z,T]=svd(X);
    U(i,:,:)=Y;A(i,:,:)=Z;V(i,:,:)=T;
end
W=imresize(W,[m/2,n/2]);
[Uw,Aw,Vw]=svd(double(W));
for i=1:m/2
    for j=1:4
        A(j,i,i)=A(j,i,i)+a*Aw(i,i);
    end
end
for j=1:1
    Y=reshape(U(j,:,:),m/2,n/2);
    Z=reshape(A(j,:,:),m/2,n/2);
    T=reshape(V(j,:,:),m/2,n/2);
    L(j,:,:)=Y*Z*T';
end
P=reshape(L(1,:,:),m/2,n/2);Q=reshape(L(2,:,:),m/2,n/2);R=reshape(L(3,:,:),m/2,n/2);S=reshape(L(4,:,:),m/2,n/2);
W_=idwt2(P,Q,R,S,'haar');
end

