origin_img = read_img('resources/test.jpg');
origin_img = cast(origin_img, 'double');

% show img
subplot(1,3,1);imagesc( origin_img ); title('origin image')
colormap('gray'); axis image; axis off

img = pad_img(origin_img);

% increament degree
degree = 3;

proj_collect = get_proj(img, degree);

% do filter
filtered_proj = ramp_filter_spatial(proj_collect);

% filtered backprojection
I = back_proj(filtered_proj, degree);

% normalize filtered backprojection
I = mat2gray(I).*255;

subplot(1,3,2);imagesc( I ); title('filtered backproject')
colormap('gray'); axis image; axis off

% unfiltered backprojection
I2 = back_proj(proj_collect, degree);

% normalize unfiltered backprojection
I2 = mat2gray(I2).*255;


subplot(1,3,3);imagesc( I2 ); title('unfiltered backproject')
colormap('gray'); axis image; axis off


% caluculate reconstructed error
filtered_error = sum(abs(I - origin_img), 'all');
unfiltered_error = sum(abs(I2 - gray), 'all');

filtered_error
unfiltered_error