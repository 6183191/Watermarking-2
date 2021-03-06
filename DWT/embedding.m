function [embedded_image] = embedding(input_image, watermarking_image)

[a, b]=size(input_image);
watermarking_image=imresize(watermarking_image, [a, b]);

[coef1_1, coef1_1h, coef1_1v, coef1_1d]=dwt2(input_image, 'haar');
[coef1_2, coef1_2h, coef1_2v, coef1_2d]=dwt2(coef1_1, 'haar');
[coef1_3, coef1_3h, coef1_3v, coef1_3d]=dwt2(coef1_2, 'haar');

[coef2_1, coef2_1h, coef2_1v, coef2_1d]=dwt2(watermarking_image, 'haar');
[coef2_2, coef2_2h, coef2_2v, coef2_2d]=dwt2(coef2_1, 'haar');
[coef2_3, coef2_3h, coef2_3v, coef2_3d]=dwt2(coef2_2, 'haar');

new_coef3=coef1_3*0.999+coef2_3*0.0215;
new_coef2=idwt2(new_coef3, coef1_3h, coef1_3v, coef1_3d, 'haar');
new_coef1=idwt2(new_coef2, coef1_2h, coef1_2v, coef1_2d, 'haar');
embedded_image=idwt2(new_coef1, coef1_1h, coef1_1v, coef1_1d, 'haar');

end

