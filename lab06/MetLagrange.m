function [y] = MetLagrange(X, Y, x)
  syms Q;
  n = length(X);
  Pn = 0;
  for k=1:n
      Lnk = 1;
      for i=1:n
          if i==k
              continue
          end
          Lnk = Lnk * (Q-X(i)) / (X(k)-X(i));
      end
      Pn = Pn + Lnk*Y(k);
  end
  Pn = matlabFunction(Pn, 'vars', {Q});
  vectorize(Pn);
  y = Pn(x);
end