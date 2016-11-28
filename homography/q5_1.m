
function [H2to1,warpedImg,panoImg] = q5_1(img1,img2,pts)

plotMatches(img1,img2,pts);

taj1_m=pts(1:2,:);
taj2_m=pts(3:4,:);

%homogenizing
taj1_h=[taj1_m;ones(1,size(taj1_m,2))];
taj2_h=[taj2_m;ones(1,size(taj2_m,2))];


H2to1=computeH(taj1_h,taj2_h);
save('q5_1.mat','H2to1')
taj2_features_warped = H2to1 * taj2_h;


for k=1:size(taj2_features_warped,2)
    
    X(1,k)=taj2_features_warped(1,k)./taj2_features_warped(3,k);
    X(2,k)=taj2_features_warped(2,k)./taj2_features_warped(3,k);
    %reducing taj2_features_warped from 3d to 2d
end

save('q5_1_warpedFeatures.mat','X')

%finding the RMS error between taj2 transformed to taj1 and previously declared
%taj1

for t=1:size(X,2)
    error(1,t)=sqrt((X(1,t)-taj1_m(1,t))^2 + (X(2,t)-taj1_m(2,t))^2);
    
end
disp('The rms error between the transformed and the old points is equal to');
rms_error = sqrt( (error * error')*(1/size(error,2))   )
taj2_warped = warpH(img2,H2to1,[size(img1,1),3000],0);

save('q5_1.fpg','taj2_warped');
warpedImg=taj2_warped;%to match the assignments output variable
panorama=imfuse(img1,taj2_warped,'blend');
panoImg=panorama;
end




