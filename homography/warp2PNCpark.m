% Uzair Ahmed
% Q 4.2
% 2015

function [img_yourname_warped, img_PNCpark_yourname] = warp2PNCpark(img_PNCpark, img_yourname, p1, p2)
disp('In warp2PNC');

p1=[p1';ones(1,size(p1',2))]%homogenizing
p2=[p2';ones(1,size(p2',2))]%homogenizing
H2to1 =computeH(p1, p2) 

img_yourname_warped = warpH(img_yourname,H2to1,[size(img_PNCpark,1),size(img_PNCpark,2)],0);
B=img_PNCpark;
C=img_yourname_warped;     

for i=1:size(C,1)
    for j=1:size(C,2)
        for k=1:3
            if C(i,j,k)~= 0
           B(i,j,k) =C(i,j,k);
            end
        end
    end
end

img_PNCpark_yourname =B;
