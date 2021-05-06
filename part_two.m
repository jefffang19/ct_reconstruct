img = read_img('resources/test.jpg');
proj_collect = get_proj(img, 3);

% plot projection image
imshow(proj_collect,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

filtered_proj = ramp_filter(proj_collect);

% plo tfiltered projection image
imshow(filtered_proj,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

% tell matlab to do inverse FBP without a filter
theta=0:3:180;
I1 = iradon(filtered_proj, theta, 'linear', 'none');
subplot(1,1,1);imagesc( real(I1) ); title('Manual filtering')
colormap('gray'); axis image; axis off

% frequency space
pad_len = sqrt(512^2+512^2);
freq_domain = zeros(cast(pad_len, 'int32'), cast(pad_len, 'int32'));
mid = cast(pad_len/2, 'int32');
for i=1:freq_i-1 
    % draw a line in frequency space
    freq_domain(mid, :) = real(fft(proj_collect(i, :)));
    
    
    %  rotate
    freq_domain = imrotate(freq_domain,i*degree,'bilinear','crop');
end

imshow(freq_domain)

X = ifft2(freq_domain);

imshow(real(X))
