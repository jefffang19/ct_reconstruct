img = read_img('resources/test.jpg');
proj_collect = get_proj(img, 3);

% plot projection image
theta = 0:3:180;
imshow(proj_collect,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

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
