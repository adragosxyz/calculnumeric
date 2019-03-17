function [x] = GaussPivTot(A,b)
  n = length(b);
  A = [A b];
  index = 1:n;
  for k=1:n-1
      apm = 0;
      for i=k:n
          for j=k:n
              if abs(A(i,j))>apm
                  apm = abs(A(i,j));
                  p = i;
                  m = j;
              end
          end
      end
      if apm==0
        disp 'Sistem incompatibil sau sistem compatibil nedeterminat';
        return;
      end
      if p~=k
          A([p k],:) = A([k p],:);
      end
      if m~=k
          A(:,[m k]) = A(:,[k m]);
          index([m k]) = index([k m]);
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
  x_tmp = SubsDesc(A(:,1:n),A(:,n+1));
  for i=1:n
      x(i) = x_tmp(index(i));
  end
  x = x';
end