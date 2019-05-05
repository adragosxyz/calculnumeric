function [y, z] = MetHermite(X, Y, Z, x)
  n = length(X)-1;
  Her = 0;
  HerD = 0;
  for k=1:n+1
      Lpk = zeros(size(x));
      Ld = zeros(size(x));
      L = ones(size(x));
      produs = ones(size(x));
      numitor = ones(size(x));
      asemenea = zeros(size(x));
      for i=1:n+1
        if i~=k
            for m=1:length(x)
                if (x(m)-X(i))~=0
                    produs(m) = produs(m) * (x(m)-X(i));
                else
                    asemenea(m) = 1;
                end 
            end
            numitor = numitor .* (X(k)-X(i));
        end
      end
      for i=1:n+1
        if i~=k
          L = L .* (x-X(i))./(X(k)-X(i));
          Lpk = Lpk + 1./(X(k)-X(i));
          for m=1:length(x)
              if (x(m)-X(i))~=0
                  if asemenea(m)==0
                      Ld(m) = Ld(m) + produs(m)/((x(m)-X(i))*(numitor(m)));
                  end
              else
                  Ld(m) = Ld(m) + produs(m)/numitor(m);
              end
          end
        end
      end
      H = L.*L.*(1-2.*Lpk.*(x-X(k)));
      K = L.*L.*(x-X(k));
      Her = Her + H.*Y(k) + K.*Z(k);
      Hd = 2.*L.*Ld.*(1-2.*Lpk.*(x-X(k))) - L.*L.*2.*Lpk;
      Kd = 2.*L.*Ld.*(x-X(k)) + L.*L;
      HerD = HerD + Hd.*Y(k) + Kd.*Z(k);
  end
  y = Her;
  z = HerD;
end