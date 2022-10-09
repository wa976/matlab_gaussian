function [x] = GaussNaive(A, b)
% GaussNaive: naive Gaussian elimination
%   x = GaussNaive(A,b): Gaussian elimination without pivoting.
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
    % Row scaling
    s = Aug(i,i);
    Aug(i,:) = Aug(i,:) / s;
    for j = i+1:n
        %=======================================
        % Elimination
        % Fill in the code below:
        % 1열의 값으로 나눈 factor 값을 구한다
        factor = Aug(j,i)/Aug(i,i);
        % factor 값을 곲한 값들을 기준열에서 빼준다.
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
        % 마지막열의 x값부터 차례대로 역으로 구한다.
        Aug(i-1,n+1) = Aug(i-1,n+1)-Aug(i-1,i:n)*Aug(i:n,n+1)/(i-1);
  
        %=======================================
    end
end


% Solution
x = Aug(:,n+1);

