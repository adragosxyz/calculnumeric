function [y] = MetNeville(X,Y,x)
  n = length(X)-1;
  Q = zeros(n+1);
  for indice=1:length(x)
      for i=1:n+1
          Q(i,1) = Y(i);
      end
      for i=2:n+1
          for j=2:i
              Q(i,j) = ((x(indice)-X(i-j+1))*Q(i,j-1)-(x(indice)-X(i))*Q(i-1,j-1)) / (X(i) - X(i-j+1));
          end
      end
      y(indice) = Q(n+1,n+1);
  end
end