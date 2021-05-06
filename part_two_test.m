img = imread('resources/test.jpg');
gray = rgb2gray(img);
gray = imresize(gray, [512, 512]); % resize

% pad image
pad_len = sqrt(512^2+512^2);
p = cast(cast((pad_len - 512)/2, 'int32'), 'double');
gray_pad = padarray(gray,[p p],0,'both');

%  rotate
J = imrotate(gray_pad,45,'bilinear','crop');
imshow(J)

% projection

projection = max(J);
imshow(projection)

% do 1d fft to projection
Y = fft(projection);

imshow(real(Y))

freq_domain = zeros(512);

% draw a line in frequency space
freq_domain(256, :) = Y;

imshow(freq_domain)