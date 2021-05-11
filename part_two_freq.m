origin_img = read_img('resources/test.jpg');

% show img
subplot(1,2,1);imagesc( origin_img ); title('origin image')
colormap('gray'); axis image; axis off

img = pad_img(origin_img);

degree = 0.3;

proj_collect = get_proj(img, degree);

% plot projection image
% imshow(proj_collect,[],'InitialMagnification','fit')
% xlabel('\theta (degrees)')
% ylabel('x''')
% colormap(gca,hot), colorbar

filtered_proj = ramp_filter_freq(proj_collect);

% plot filtered projection image
% imshow(filtered_proj,[],'InitialMagnification','fit')
% xlabel('\theta (degrees)')
% ylabel('x''')
% colormap(gca,hot), colorbar

% backprojection
I = back_proj(filtered_proj, degree);
subplot(1,2,2);imagesc( I ); title('backproject')
colormap('gray'); axis image; axis off
