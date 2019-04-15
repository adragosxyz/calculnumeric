function [x] = SubsAsc(A, b)
   n = length(b);
   x(1) = b(1)/A(1,1);
   for k=2:n
      suma = 0;
      for j=1:k-1
          suma = suma + A(k,j)*x(j);
      end
      x(k) = (b(k) - suma)/A(k,k);
   end
   x = x';
end