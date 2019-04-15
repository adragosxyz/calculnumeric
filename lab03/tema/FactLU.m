function [L, U, w] = FactLU(A)
  n = size(A, 1);
  L = eye(n);
  for k=1:n-1
     A
     L
     p=k;
     max = abs(A(p,k));
     for i=k:n
         if abs(A(i,k))>max
             max = abs(A(i,k));
             p=i;
         end
     end
     if A(p,k)==0
         disp 'Sistem incompatibil';
         return;
     end
     w(k) = p;
     if p~=k
         A([p k],:) = A([k p],:);
     end
     for l=k+1:n
         L(l,k) = A(l,k)/A(k,k);
         A(l,:) = A(l,:) - L(l,k)*A(k,:);
     end
     if k>1
         L([p k], 1:k-1) = L([k p], 1:k-1);
     end
  end
  A
  L
  if A(n,n)==0
      disp 'Sistem incompatibil';
      return;
  end
  U = A;
end
