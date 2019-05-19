function [dy] = DerivNum(x,y,metoda)
  m = length(x)-1;
  switch metoda
      case 'diferente finite progresive'
          for i=2:m
              dy(i) = (y(i+1)-y(i)) / (x(i+1)-x(i));
          end
      case 'diferente finite regresive'
          for i=2:m
              dy(i) = (y(i)-y(i-1)) / (x(i)-x(i-1));
          end
      case 'diferente finite centrale'
          for i=2:m
              dy(i) = (y(i+1)-y(i-1)) / (x(i+1)-x(i-1));
          end
  end
end