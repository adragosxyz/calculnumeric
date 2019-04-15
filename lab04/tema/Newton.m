function [xaprox, N] = Newton(F, J, x0, eps)
    k=1;
    x(1,1) = x0(1);
    x(2,1) = x0(2);
    
    while true
        k = k+1;
        %z = J(x(1,k-1), x(2,k-1))\(-F(x(1,k-1), x(2,k-1)));
        %z = inv(J(x(1,k-1), x(2,k-1)))*(-F(x(1,k-1), x(2,k-1)));
        z = GaussPivTot(J(x(1,k-1), x(2,k-1)), (-F(x(1,k-1), x(2,k-1))));
        x(:,k) = z+x(:,k-1);
        if norm(z, 2) < eps
            break
        end
    end
    xaprox(1,1)=x(1,k);
    xaprox(2,1)=x(2,k);
    N=k;
end