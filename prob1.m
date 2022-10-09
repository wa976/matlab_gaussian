close all
clear
clc

% Define problem
%  150*x - 100*y        = 588.6
% -100*x + 150*y - 50*z = 686.7
%        -  50*y + 50*z = 784.8
A = [50 -100 0; 0 150 -50; 50 0 50]
b = [588.6; 686.7; 784.8]

% The left division method
x1 = A\b

% The matrix inverse method
x2 = inv(A)*b

% Gaussian elimination
% COMPLETE THE FOLLOWING FUNCTION!!!
x3 = GaussNaive(A, b)

% The results of the three functions above should be the same.
if norm(x2-x3) < 1e-6
    fprintf("Good job!!\n");
else
    fprintf("Try again..\n");
end

