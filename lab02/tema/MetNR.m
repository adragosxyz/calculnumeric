function [x_aprox] = MetNR(f, df, x0, eps)
  k=2;
  x(1) = x0;
  x(k) = x(k-1)-f(x(k-1))/df(x(k-1));
  while abs(x(k)-x(k-1))/abs(x(k-1)) >= eps
      k = k+1;
      x(k) = x(k-1)-f(x(k-1))/df(x(k-1));
  end
  x_aprox = x(k);
end