close all
clear
clc

% Define problem
%       1*y - 1*z = -1
% 3*x - 1*y + 1*z =  4
% 1*x + 1*y - 2*z = -3
A = [1 0 -1; 0 -1 1; 3 1 -2]
b = [-1; 4; -3]

% The left division method
x1 = A\b

% The matrix inverse method
x2 = inv(A)*b

% Gaussian elimination
% COMPLETE THE FOLLOWING FUNCTION!!!
x3 = GaussPivot(A, b)

% The results of the three functions above should be the same.
if norm(x2-x3) < 1e-6
    fprintf("Good job!!\n");
else
    fprintf("Try again..\n");
end

