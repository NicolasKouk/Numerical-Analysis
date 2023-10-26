% finds the root of f(x)=0, using the secant method with given tolerance and maximum iterations (N_max)
function [root, counter] = secant(f, x1, x2, tol, N_max)
  xn = x2 - f(x2)*(x2 - x1)/(f(x2) - f(x1));
  counter = 1;
% below we check both criteria, so the sicant method doesn't fail
  while ((f(xn) > tol) || (abs(xn-x2) > tol)) && (counter < N_max)
    x1 = x2;
    x2 = xn;
    xn = x2 - f(x2)*(x2 - x1)/(f(x2) - f(x1));
    counter = counter + 1;
  end
  root = xn;
  if counter == N_max
    disp('Too many steps');
  end
