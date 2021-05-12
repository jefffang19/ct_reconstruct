img = imread('resources/test.jpg');
gray = rgb2gray(img);
gray = imresize(gray, [512, 512]); % resize
gray = cast(gray, 'double');

% Radon Transform
degree = 0.3;
theta = 0:degree:180;
[R,xp] = radon(gray,theta);

% iRadon Transform

% Perform filtered backprojection.
I1 = iradon(R,theta);
I1 = imcrop(I1, [1 1 511 511]);
% normalize unfiltered backprojection
I1 = mat2gray(I1).*255;
% Perform unfiltered backprojection.
I2 = iradon(R,theta,'linear','none');
I2 = imcrop(I2, [1 1 511 511]);
% normalize unfiltered backprojection
I2 = mat2gray(I2).*255;
% Display the reconstructed images.

figure
subplot(1,3,1)
imshow(gray,[])
title('Origin Image')
subplot(1,3,2)
imshow(I1,[])
title('Filtered Backprojection')
subplot(1,3,3)
imshow(I2,[])
title('Unfiltered Backprojection')

% caluculate reconstructed error
filtered_error = sum(abs(I1 - gray), 'all');
unfiltered_error = sum(abs(I2 - gray), 'all');

filtered_error
unfiltered_error