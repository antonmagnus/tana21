C = full(gallery('tridiag',10,-1,2.1,-1));
b = 3.5 * ones(10,1);
x0 = ones(10,1)

[x, k] = gaussSeidel(C, C * b,x0, 10e-8)
