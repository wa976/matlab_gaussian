function [x] = GaussPivot(A, b)
% GaussPivot: Gaussian elimination
%   x = GaussPivot(A,b): Gaussain elimination with pivoting.
% input:
%   A = coefficient matrix
%   b = right hand side vector
% output:
%   x = solution vector

[m,n] = size(A);
if m~=n
    error('Matrix A must be square');
end

% Augmented matrix [A b]
Aug = [A b];

% Forward substitution
for i = 1:n
    %=======================================
    % Partial pivoting and row permutation
    % Fill in the code below:
    % 기준 x값의 절댓값이 가장 큰 열이 가장 위로 오게끔 정렬해준다
    [big,P] = max(abs(Aug(i:n,i)));
    ipr=P + i-1;
    Aug([ipr,i],:) = Aug([i,ipr],:);
    

    %=======================================

    % Row scaling
    s = Aug(i,i);
    Aug(i,:) = Aug(i,:) / s;

    for j = i+1:n
        %=======================================
        % Elimination
        % Fill in the code below:
        factor = Aug(j,i)/Aug(i,i);
        Aug(j,i:n+1) = Aug(j,i:n+1)-Aug(i,i:n+1)*factor;

        %=======================================
    end
end

% Backward substitution
for i = n:-1:1
    for j = 1:i-1
        %=======================================
        % Elimination
        % Fill in the code below:
        Aug(i-1,n+1) = Aug(i-1,n+1)-Aug(i-1,i:n)*Aug(i:n,n+1)/(i-1);
   
        %=======================================
    end
end

% Solution
x = Aug(:,n+1);

