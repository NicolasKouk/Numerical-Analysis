% performs an LU decompotition with the Gaussian Elimination method on a tridiagonal matrix
function [L, U] = LUdec_tr(A)
  n = size(A ,1) ;
  for k = 1:n -1
%    A(k+1: n, k) = A(k+1: n, k) / A(k , k);
    A(k+1, k) = A(k+1, k) / A(k, k); % the multiplicator

%    A(k+1: n, k +1: n) = A(k+1: n, k +1: n) - A(k +1: n, k) * A(k, k +1: n);
    for j = k+1:min([k+2, n])
      A(k+1,j) = A(k+1,j) - A(k+1, k) * A(k, j);
    end
  end
  L = eye(n, n) + tril(A, -1);
  U = triu(A);
