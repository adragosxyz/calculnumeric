function [df] = MetRichardson(f, x, h, n)
  phi = @(x,h)(f(x+h)-f(x))/h;
  for k=1:length(x)
      for i=1:n
          Q(i,1) = phi(x(k),h/(2^(i-1)));
      end
      for i=2:n
          for j=2:i
              Q(i,j) = Q(i,j-1) + (Q(i,j-1)-Q(i-1,j-1))/(2^(j-1)-1);
          end
      end
      df(k) = Q(n,n);
  end
end