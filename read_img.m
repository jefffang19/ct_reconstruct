% read image and resize to 512x512
% and then pad to 724x724 (=sqrt(512^2+512^2))
function img = read_img(path)
    img = imread(path);
    gray = rgb2gray(img);
    gray = imresize(gray, [512, 512]); % resize
    
    % pad image
    pad_len = sqrt(512^2+512^2);
    p = cast(cast((pad_len - 512)/2, 'int32'), 'double');
    img = padarray(gray,[p p],0,'both');
end
