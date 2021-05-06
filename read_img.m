% read image and resize to 512x512
function img = read_img(path)
    img = imread(path);
    gray = rgb2gray(img);
    img = imresize(gray, [512, 512]); % resize
end
