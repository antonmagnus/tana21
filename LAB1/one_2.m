for n = 7:12
    e = exp(1);
    xex = factorial(n);
    xapp = sqrt(2*pi*n)*(n./e)^n;
    abserr = abs(xex - xapp);
    reerr = (abs(xex - xapp))./ (abs(xex));
    
    fprintf('n = %d \n',n);
    fprintf('n! = %d \n',xex);
    fprintf('Stirling’s approximation = %f \n',xapp);
    fprintf('Absolute error = %f \n',abserr);
    fprintf('Relative error = %f \n',reerr);
    fprintf('--------------------- \n');
end