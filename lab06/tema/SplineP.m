function [y,z] = SplineP(X, Y, fpa, x)
  n = length(X)-1;
  for j=1:n
      a(j) = Y(j);
  end
  b(1) = fpa;
  h = X(2)-X(1);
  for j=1:n-1
      b(j+1) = (2*(Y(j+1) - Y(j)) / h) - b(j);
  end
  
  for j=1:n
      c(j) = (Y(j+1) - Y(j) - h*b(j))/(h*h);
  end
  
  for i=1:length(x)
    for j=1:n
      if x(i) >= X(j) && x(i) <= X(j+1)
          y(i) = a(j) + b(j)*(x(i)-X(j)) + c(j)*(x(i)-X(j))^2;
          z(i) = b(j) + 2*c(j)*(x(i)-X(j));
      end
    end
  end  
end