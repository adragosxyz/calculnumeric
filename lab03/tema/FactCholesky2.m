function [L] = FactCholesky2(A)
  n = size(A,2);
  if n==1
      L = A;
  else
      a = A(1,1);
      if a<=0
        disp('A nu admite factorizarea Cholesky')
        return
      end
      L(1,1) = sqrt(a);
      L(2:n,1) = A(2:n,1)/L(1,1);
      newA = A(2:n,2:n) - L(2:n,1)*(L(2:n,1)');
      L = [L [linspace(0,0,n-1) ; FactCholesky2(newA)]];
  end
end