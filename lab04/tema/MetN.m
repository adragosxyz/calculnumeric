function [y] = MetN(X, Y, x)
  syms Q;
  n = length(X);
  Pn = 0;
  for i=1:n
      for j=1:n
          if j==1
              A(i,j)=1;
          elseif j>i
              A(i,j)=0;
          else
              prod = 1;
              for k=1:j-1
                  prod = prod * (X(i)-X(k));
              end
              A(i,j) = prod;
          end
      end
  end
  c = SubsAsc(A, Y');
  for i=1:n
      coef = c(i);
      for k=1:i-1
          coef = coef * (Q - X(k));
      end
      Pn = Pn + coef;
  end
  Pn = matlabFunction(Pn, 'vars', {Q});
  vectorize(Pn);
  y = Pn(x);
end