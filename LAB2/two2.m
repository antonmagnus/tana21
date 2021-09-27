C = full(gallery('tridiag',10,-1,2.1,-1));
b = 1:10:100;
x0 = 1:1:10
[x, k] = gaussSeidel(C,b,x0, 10e-8)

https://www.matlabcoding.com/2019/01/gauss-seidel-method-using-matlabmfile.html