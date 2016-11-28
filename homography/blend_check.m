A = imread('XA_404_Chimaera_by_Davide_sd.jpg');
B = imread('The_Fight_by_Davide_sd.jpg');

% type: help blendMode      to see a list of blend modes aviable
mode = 'Normal';

% move B in respect to the top-left corner of A
offsetW = 1;
offsetH = 1;

imshow(A);
figure;
imshow(B)
figure;
tic
imshow(blendMode(A, B, mode, offsetW, offsetH));
toc