f = @(x) 3*x - cos(2*pi*x);
fprime = @(x) 3 + 2*pi*sin(2*pi*x);

% be warned shitty code ahead
tol = 1e-09;
xk = 0.4;
[xVals,iter] = steffensen(f,xk,tol);
%[xVals,iter] = newtonRaphson(f,fprime,xk,tol);
xkarr = xVals;
tot_eoc = 0;
for k = 1: length(xkarr)
    xk = xkarr(k);
    if k == 1
        xkold = 0;
    else
        xkold = xkarr(k-1);
    end
    xstar = 1/6;

    fxk = f(xk);
    xold = 0;
    abserr = abs(xstar - xk);
    
    if k == 1
        eoc = 0;
    else
        eoc = (log(abs(xstar - xk)))./(log(abs(xstar-xkold)));
    end
    
    tot_eoc = tot_eoc+eoc;
    
    fprintf('k = %d \n',k);
    fprintf('xk = %d \n',xk);
    fprintf('f(xk) = %f \n',fxk);
    fprintf('Absolute error = %f \n',abserr);
    fprintf('eoc= %f \n',eoc);
    fprintf('--------------------- \n');
end

fprintf('average eoc= %f \n',tot_eoc./(length(xkarr)-1));