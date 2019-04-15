function [y] = MetDirecta2(X, Y, x)
  syms Q;
  n = length(X);
  for i=1:n
      A(i,1)=1;
  end
  for i=1:n
      for j=2:n
          A(i,j) = X(i)^(j-1);
      end
  end
  a = GaussPivTot(A, Y);
  Pn = 0;
  for i=1:length(a)
    Pn = Pn + a(i)*Q^(i-1);
  end
  Pn = matlabFunction(Pn, 'vars', {Q});
  vectorize(Pn);
  y = Pn(x);
end