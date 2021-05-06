img = read_img('resources/test.jpg');

degree = 0.3;

proj_collect = get_proj(img, degree);

% plot projection image
imshow(proj_collect,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

filtered_proj = ramp_filter(proj_collect);

% plot filtered projection image
imshow(filtered_proj,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

% backprojection
I = back_proj(filtered_proj, degree);
subplot(1,1,1);imagesc( I ); title('backproject')
colormap('gray'); axis image; axis off
