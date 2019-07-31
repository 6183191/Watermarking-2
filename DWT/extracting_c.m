function [output] = extracting_c(embedded_image, original_image)

embedded_image_R=embedded_image(:, :, 1);
embedded_image_G=embedded_image(:, :, 2);
embedded_image_B=embedded_image(:, :, 3);
original_image_R=original_image(:, :, 1);
original_image_G=original_image(:, :, 2);
original_image_B=original_image(:, :, 3);

output_R=extracting(embedded_image_R, original_image_R);
output_G=extracting(embedded_image_G, original_image_G);
output_B=extracting(embedded_image_B, original_image_B);

output=cat(3, output_R, output_G, output_B);

end

