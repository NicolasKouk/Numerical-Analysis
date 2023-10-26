function [root, counter] = bisection(f, xL, xR, tol, N_max)
  m = xL + (xR - xL)/2; % the first approximation
  counter = 1;
  while (abs(xR - xL) > tol) && (counter < N_max)
    if f(m) == 0
      root = m;
      return
    end
    if sign(f(xL)) ~= sign(f(m)) % Bolzano => there is a root in [xL, m]
      xR = m;
    else % Bolzano => there is a root in [m, xR]
      xL = m;
    end
    m = xL + (xR - xL)/2; % better than usual to get it more stable
    counter = counter + 1; % the variable to count the steps needed for the approximation
  end
  root = m;
  if counter == N_max
    disp('Too many steps');
  end
