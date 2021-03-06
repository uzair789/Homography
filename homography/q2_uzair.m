%function [H2to1_q52,panoImg_q52]= q5_2(im1,im2,pts)
%
im1 = imread('taj1r.jpg');
im2 = imread('taj2r.jpg');
pts =load('tajPts.mat');
pts = pts.tajPts;
%}
taj1_m=pts(1:2,:);
taj2_m=pts(3:4,:);

%homogenizing
taj1_h=[taj1_m;ones(1,size(taj1_m,2))];
taj2_h=[taj2_m;ones(1,size(taj2_m,2))];

%outSize=[1280/4,2000];

scaleFactorX=1280/size(panoImg_q51,2);%3000;%/2/(size(im1,2));%%1280%685
scaleFactorY=(1280/3.25)/size(panoImg_q51,1);%(1068);%size(im1,1);%(1280/5)/size(im1,1);1280/
H2to1_q52=computeH(taj1_h,taj2_h);

trans_x=00;
trans_y=182;
M = [scaleFactorX 0 trans_x;
    0 scaleFactorY trans_y;
    0 0 1;];

taj2_im1 = warpH(im1,M,[1280/2,1280],0);%[size(im1,1),1280]

taj2_warped = warpH(im2,M*H2to1_q52,[1280/2,1280],0);%[size(im1,1),1280]

warpedImg=taj2_warped;%to match the assignments output variable
panoImg_q52=imfuse(taj2_im1,taj2_warped,'blend');

figure;
imshow(taj2_im1);
title('im1');

figure;
imshow(taj2_warped)
title('taj2_warped');

%
figure;
imshow(panoImg_q52);
title('PanoImg');
%}
%end

