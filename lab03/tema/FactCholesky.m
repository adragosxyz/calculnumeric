function [L] = FactCholesky(A)
  a = A(1,1);
  n = size(A,2);
  if a <= 0
      disp('A nu admite factorizarea Cholesky')
      return
  end
  L(1,1) = sqrt(a);
  for i=2:n
      L(i, 1) = A(i,1)/L(1,1);
  end
  for k=2:n
      suma = 0;
      for s=1:k-1
          suma = suma + L(k,s)*L(k,s);
      end
      a = A(k,k) - suma;
      if a <= 0
        disp('A nu admite factorizarea Cholesky')
        return
      end
      L(k,k) = sqrt(a);
      for i=k+1:n
          suma = 0;
          for s=1:k-1
              suma = suma + L(i,s)*L(k,s);
          end
          L(i,k) = (A(i,k)-suma)/L(k,k);
      end
  end
end