function [embedded_image] = embedding_c(input_image, watermarking_image)

input_image_R=input_image(:, :, 1);
input_image_G=input_image(:, :, 2);
input_image_B=input_image(:, :, 3);
watermarking_image_R=watermarking_image(:, :, 1);
watermarking_image_G=watermarking_image(:, :, 2);
watermarking_image_B=watermarking_image(:, :, 3);

embedded_image_R=embedding(input_image_R, watermarking_image_R);
embedded_image_G=embedding(input_image_G, watermarking_image_G);
embedded_image_B=embedding(input_image_B, watermarking_image_B);

embedded_image=cat(3, embedded_image_R, embedded_image_G, embedded_image_B);

end

