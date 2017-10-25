function result = homog(input_points,base_points);
% returns the 9x1 homography vector
% function result = homog(input_points,base_points);
N = length(input_points);
A = zeros(2*N,9);
j = 1;
for i = 1:2:2*N,
X1 = input_points(j,1);
Y1 = input_points(j,2);
x1 = base_points(j,1);
y1 = base_points(j,2);
A(i,1) = x1; A(i,2) = y1; A(i,3) = 1;
A(i,4) = 0; A(i,5) = 0; A(i,6) = 0;
A(i,7) = -x1*X1;A(i,8) = -y1*X1;A(i,9) = -X1;
ii = i+1;
A(ii,1) = 0; A(ii,2) = 0; A(ii,3) = 0;
A(ii,4) = x1; A(ii,5) = y1; A(ii,6) = 1;
A(ii,7) = -x1*Y1;A(ii,8) = -y1*Y1;A(ii,9) = -Y1;
j = j+1;
end;
[U,S,V] = svd(A);
result = V(:,9);