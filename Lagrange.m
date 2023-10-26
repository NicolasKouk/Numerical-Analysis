% performs a Lagrange interpolation for the points (x_i, f(x_i))
function px = Lagrange(xi, fxi, x)
  n = max([size(xi)(1), size(xi)(2)]); 
  px = 0;
  for i = 1:n
    L = 1;
    for j = 1:n
      if j ~= i
        L = L * (x-xi(j))/(xi(i)-xi(j));
      end
    end
    px = px + fxi(i)*L;
  end
  
  
  
