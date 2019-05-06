function [y, z] = Hermite(X, Y, Z, x)
  n = length(X)-1;
  Her = 0;
  Herp=0;
  for k=1:n+1
      Lpk = zeros(size(x));
      L = ones(size(x));
      for i=1:n+1
        if i~=k
          L = L .* (x-X(i))./(X(k)-X(i));
          Lpk = Lpk + 1./(X(k)-X(i)); 
        end
      end
    c
  end
  y = Her;
  z = [];
  % Urmeaza sa fie implementat z = Her derivat
end