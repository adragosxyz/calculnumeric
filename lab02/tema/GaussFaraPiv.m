function [x] = GaussFaraPiv(A,b)
  n = length(b);
  A = [A b];
  for k=1:n-1
      for p=k:n
          if A(p,k)~=0
              break
          end
      end
      if p~=k
          A([p k],:) = A([k p],:);
      end
      for l=k+1:n
          mlk = A(l,k)/A(k,k);
          A(l,:) = A(l,:) - mlk*A(k,:);
      end
  end
  if A(n,n)==0
      disp 'Sistem incompatibil sau sistem compatibil nedeterminat';
      return;
  end
  x = SubsDesc(A(:,1:n),A(:,n+1));
end