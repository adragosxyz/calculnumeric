function [x_aprox, N] = MetPozFalse(f, a, b, eps)
    N = floor(log2((b-a)/eps));
    x = (a+b)/2;
    k = 1;
    x(k) = (a*f(b)-b*f(a))/(f(b)-f(a));
    k=k+1;
    if sign(f(a))*sign(f(x(k-1)))<0
        b = x(k-1);
    else
        a = x(k-1);
    end
    x(k) = (a*f(b)-b*f(a))/(f(b)-f(a));
    while abs(x(k)-x(k-1))/abs(x(k-1)) >= eps
        k=k+1;
        if f(x(k-1))==0
            break;
        elseif sign(f(a))*sign(f(x(k-1)))<0
            b = x(k-1);
        else
            a = x(k-1);
        end
        x(k) = (a*f(b)-b*f(a))/(f(b)-f(a));
    end
    x_aprox=x(k);
    N = k;
end