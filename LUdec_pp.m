% performs an LU decompotition with the Gaussian Elimination method with partial pivoting
function [L, U, P] = LUdec_pp(A) 
  n = size (A ,1);
  L = eye(n, n);
  P = eye(n, n);
  U = A;
  for i = 1 : n-1
    [m, r] = max(abs(U(i:n,i))); % we find the max and its position
    U([i,r+i-1], :) = U([r+i-1,i], :); % we swap the k-th and the r-th row
    P([i,r+i-1], :) = P([r+i-1,i], :); % we make necessary changes to P
    L([i,r+i-1],1:i-1)=L([r+i-1,i],1:i-1);
    for j = i+1 : n
      L(j, i) = U(j, i) / U(i, i);
      for k = i:n
        U(j, k) = U(j, k) - L(j, i) * U(i, k);
      end
    end
  end
