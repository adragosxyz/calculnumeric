function [xaprox, N] = Newton(f, fp, x0, eps)
  k = 1;
  x(1) = x0;
  while true
      k = k+1;
      x(k) = x(k-1) - f(x(k-1))/fp(x(k-1));
      if abs(x(k)-x(k-1))/abs(x(k-1)) < eps  
        break;
      end
  end
  xaprox = x(k);
  N = k;
end