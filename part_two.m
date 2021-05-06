img = imread('resources/test.jpg');
gray = rgb2gray(img);
gray = imresize(gray, [512, 512]); % resize

% pad image
pad_len = sqrt(512^2+512^2);
p = cast(cast((pad_len - 512)/2, 'int32'), 'double');
gray_pad = padarray(gray,[p p],0,'both');


% rotate degree
degree = 3;

% 1d projection collect
proj_collect = zeros(180/degree+1, cast(pad_len, 'int32'));



freq_i = 1;
for i=0:degree:180
    J = imrotate(gray_pad,i,'bilinear','crop'); 
    % projection
    projection = sum(J, 2);

    proj_collect(freq_i, :) = projection;

    freq_i = freq_i + 1;
    
end

% plot projection image
theta = 0:3:180;
imshow(proj_collect,[],'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

% frequency space
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
