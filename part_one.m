img = imread('resources/test.jpg');
gray = rgb2gray(img);
gray = imresize(gray, [512, 512]); % resize
imshow(gray)

% Radon Transform
degree = 3;
theta = 0:degree:180;
[R,xp] = radon(gray,theta);

imshow(R,[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap(gca,hot), colorbar

% iRadon Transform

% Perform filtered backprojection.
I1 = iradon(R,theta);
% Perform unfiltered backprojection.
I2 = iradon(R,theta,'linear','none');
% Display the reconstructed images.

figure
subplot(1,2,1)
imshow(I1,[])
title('Filtered Backprojection')
subplot(1,2,2)
imshow(I2,[])
title('Unfiltered Backprojection')