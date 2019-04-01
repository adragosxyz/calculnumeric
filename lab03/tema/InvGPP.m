function [invA, detA] = InvGPP(A)
  n = size(A, 1);
  A = [A eye(n)];
  for k=1:n-1
      apk = 0;
      for j=k:n
          if abs(A(j,k))>apk
              apk = abs(A(j,k));
              p = j;
          end
      end
      if apk==0
        disp 'Sistem incompatibil sau sistem compatibil nedeterminat';
        return;
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
  invA = [];
  detA = 1;
  for i=1:n
      invA = [invA SubsDesc(A(:,1:n),A(:,n+i))];
      detA = detA*A(i,i);
  end
end