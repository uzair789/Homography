
% Uzair Ahmed
% Q 4.2
% 2015

img1 = imread('pnc.jpg');
img2 = imread('pnc_tomap.jpg');
cpselect('pnc.jpg','pnc_tomap.jpg');%%,

%cpselect('pnc_tomap.jpg','pnc.jpg');
pause;
disp('In create_p1p2**********');
p2=fixedPoints
p1=movingPoints

% use cpselect to save 2 sets of point pairs
% ... move to p1 and p2 as required

save('Q4.2.p1p2.mat', 'p1', 'p2'); % save it



