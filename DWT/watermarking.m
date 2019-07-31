clc;
clear all;

% imageinput=imread('test.jpg');
% watermarkingimage=imread('watermark1.jpg');
% 
% figure(1);
% imshow(imresize(watermarkingimage,[512,512]));
% output_image=limit(embedding_c(imageinput, watermarkingimage));
% 
% figure(2);
% imshow(output_image,[0,255]);
% imwrite(output_image,'embedded.png');
% extracted_image=limit(extracting_c(output_image, imageinput));
% 
% figure(3);
% imshow(extracted_image,[0,255]);
% imwrite(extracted_image,'extracted.png');
origin=imread('test.jpg');
[a,b,c]=size(origin);
origin_R=imresize(origin(:,:,1),[a/2,b/2]);
origin_G=imresize(origin(:,:,2),[a/2,b/2]);
origin_B=imresize(origin(:,:,3),[a/2,b/2]);
origin=cat(3,origin_R,origin_G,origin_B);
embedded=imread('embedded.png');
%embedded=imrotate(embedded,30,'crop');
%embedded=imnoise(embedded, 'salt & pepper', 0.01);
figure(1);
imshow(origin);
imwrite(origin,'tort.png');
%origin=imrotate(origin,30,'crop');
extracted_image=limit(extracting_c(embedded, origin));
figure(2);
imshow(extracted_image);
imwrite(extracted_image,'tort_extracted.png');
