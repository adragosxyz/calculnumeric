function [y] = MetNDD(X,Y,x)
  n = length(X)-1;
  Q = zeros(n+1);
  for i=1:n+1
    Q(i,1) = Y(i);
  end
  for i=2:n+1
      for j=2:i
          Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (X(i)-X(i-j+1));
      end
  end
  for indice=1:length(x)
      y(indice) = Q(1,1);
      for k=2:n+1
          produs = 1;
          for z=1:k-1
              produs = produs*(x(indice)-X(z));
          end
          y(indice) = y(indice) + Q(k,k)*produs;
      end
  end
end