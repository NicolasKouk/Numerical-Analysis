% approximates a function via the Euler method, where y' = f(t,y) and y(a) = y0
% works with a given h
function y = Euler(y0, f, a, b, h)
  if a>=b || h <= 0
    y = 'Error';
    return
  end
  r = a:h:b; N = (b-a)/h + 1;
  y = zeros(1,N);

  t = a; y(1) = y0;
  for i = 2:N
    y(i) = y(i-1) + h*f(t,y(i-1));
    t = t + h;
  end

