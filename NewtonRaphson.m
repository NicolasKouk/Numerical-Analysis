function [root, counter] = NewtonRaphson(f, df, xp, tol, N_max)
  counter = 1;
  if df(xp) == 0 % checking if it's a local extremum
    root = 'Error'; 
    return
  end
  xn = xp - f(xp)/df(xp); 
% below we check both criteria, so the Newton-Raphson doesn't fail
  while ((f(xn) > tol) || (abs(xn-xp) > tol)) && (counter < N_max)
    if df(xp) == 0 % checking if it's a local extremum
      root = 'Error'; 
      return
    end
    xp = xn;
    xn = xp - f(xp)/df(xp);
    counter = counter + 1;
  end
  root = xn;
  if counter == N_max
    disp('Too many steps');
  end
