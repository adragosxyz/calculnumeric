function [x] = SubsDesc(A, b)
   n = length(b);
   x(n) = b(n)/A(n,n);
   for k=n-1:-1:1
      suma = 0;
      for j=k+1:n
          suma = suma + A(k,j)*x(j);
      end
      x(k) = (b(k) - suma)/A(k,k);
   end
   x = x';
end