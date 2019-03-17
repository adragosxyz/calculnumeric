function [x] = MetBisectie(f, a, b, eps)
    N = floor(log2((b-a)/eps));
    x = (a+b)/2;
    for k = 1:N
        if f(x)==0
            break;
        elseif sign(f(a))*sign(f(x))<0
            b = x;
        else
            a = x;
        end
        x = (a+b)/2;    
    end
end