clc;
clear all;

C=rgb2gray(imread('test.jpg'));
W=rgb2gray(imread('watermark1.jpg'));
% W_=uint8(embedding(C,W,0.02));
% imwrite(C,'gray.png');
% figure(1);
% imshow(W_,[0,255]);
% imwrite(W_,'embedded.png');
W_=imread('embedded.png');
W_=imresize(W_,size(W_)/2);
C=imresize(C,size(C)/2);
% W_=imnoise(W_, 'salt & pepper', 0.01);
% W_=imrotate(W_,30,'crop');
imwrite(W_,'tort.png');
% C=imrotate(C,30,'crop');
% W=imrotate(W,30,'crop');
reconstruct=uint8(reconstructing(C,W_,W,0.02));

figure(2);
imshow(reconstruct,[0,255]);
imwrite(reconstruct,'extracted.png');