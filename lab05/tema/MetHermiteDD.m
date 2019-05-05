function [y,z] = MetHermiteDD(X,Y,Z,x)
    n = length(X)-1;
    for i=1:n+1
        XB(2*i-1) = X(i);
        XB(2*i) = X(i);
    end
    Q = zeros(2*n+2);
    for i=1:n+1
        Q(2*i-1,1) = Y(i);
        Q(2*i,1) = Y(i);
        Q(2*i,2) = Z(i);
        if i>=2
            Q(2*i-1,2) = (Q(2*i-1, 1) - Q(2*i-2,1)) / (XB(2*i-1) - XB(2*i-2));
        end
    end
    for i=3:2*n+2
        for j=3:i
            Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (XB(i) - XB(i-j+1));
        end
    end
    for indice=1:length(x)
      y(indice) = Q(1,1);
      z(indice) = 0;
      for k=2:2*n+2
          sumaprod = 0;
          asemenea=0;
          produs = 1;
          produsDiv = 1;
          for m=1:k-1
              produs = produs*(x(indice)-XB(m));
              if (x(indice)-XB(m))~=0
                  produsDiv = produsDiv*(x(indice)-XB(m));
              else
                 asemenea= asemenea + 1; 
              end
          end
          for m=1:k-1
            if (x(indice)-XB(m)) ~= 0
                if asemenea==0
                  sumaprod = sumaprod + produsDiv/(x(indice)-XB(m));
                end
            else
                if asemenea==1
                  sumaprod = sumaprod + produsDiv;
                end
            end
          end
          z(indice) = z(indice) + sumaprod*Q(k,k);
          y(indice) = y(indice) + Q(k,k)*produs;
      end
    end
end