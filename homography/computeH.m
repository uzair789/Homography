% Uzair Ahmed
% Q 4.1
% 2015

function H2to1 = computeH(p1, p2)

N = size(p1, 2); % the number of points
A = zeros(2*N, 9); % set A to the required size
M=zeros(1,9);
Z=zeros(2,9);

for i = 1 : N
    Z=[p2(:,i)' 0 0 0 -p1(1,i).*p2(:,i)'; 
        0 0 0 p2(:,i)' -p1(2,i).*p2(:,i)'];
    M=[M;Z];
end

A=M(2:2*N+1,:);

[V,D]=eig(A'*A);

e_values=D*ones(size(D,1),1);

[I]=find(e_values==min(e_values));

H = V(:,I)% ... your code here ...

H2to1 = reshape(H,3,3)';
