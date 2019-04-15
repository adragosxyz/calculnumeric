function [a] = MetDirecta(x, y)
  n = length(x);
  for i=1:n
      A(i,1)=1;
  end
  for i=1:n
      for j=2:n
          A(i,j) = x(i)^(j-1);
      end
  end
  a = GaussPivTot(A, y);
end