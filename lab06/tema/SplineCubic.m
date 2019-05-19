%Ij = [xj, xj+1) j=1,n-1
%in = [xn, xn+1]
%Sj(x) = 
function [y,z,t] = SplineCubic(X,Y,x,fpa,fpb)
  n = length(X)-1;
  for j=1:n
      a(j) = Y(j);
  end
  B(1,1) = 1;
  B(n+1,n+1) = 1;
  for j=2:n
      B(j,j) = 4;
      B(j,j-1) = 1;
      B(j,j+1) = 1;
  end
  w(1) = fpa;
  w(n+1) = fpb;
  h = X(2)-X(1);
  for j=2:n
      w(j) = 3*(Y(j+1)-Y(j-1))/h;
  end
  w = w';
  b = B\w;
  for j=1:n
      d(j) = -2*(Y(j+1)-Y(j))/(h*h*h) + (b(j+1)+b(j))/(h*h);
      c(j) = 3*(Y(j+1)-Y(j))/(h*h) - (b(j+1)+2*b(j))/h;
  end
  for i=1:length(x)
      for j=1:n
          if x(i)<=X(j+1) && x(i)>=X(j)
              S = a(j) + b(j)*(x(i)-X(j)) + c(j)*(x(i)-X(j))*(x(i)-X(j)) + d(j)*(x(i)-X(j))*(x(i)-X(j))*(x(i)-X(j));
              Sp = b(j) + 2*c(j)*(x(i)-X(j)) + 3*d(j)*(x(i)-X(j))*(x(i)-X(j));
              Ss = 2*c(j) + 6*d(j)*(x(i)-X(j));
              break;
          end
      end
      y(i) = S;
      z(i) = Sp;
      t(i) = Ss;
  end
end