tol = 1e-3;
f = @(x) (x+1).^2.*cos((2*x+1)./(x-3.3));
[I_adapt,x_adapt] = adaptiveSimpson(f,0,3,1e-3);
