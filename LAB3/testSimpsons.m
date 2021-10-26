f = @(x) 8*x^3 - 4*x^2 + 6*x - 3;

a = -4;
b = 2;
n  = 2;
[S, x] = SimpsonsRule(f, a, b, n);

syms x;
g = 8*x^3 - 4*x^2 + 6*x - 3;

I = int(g, a, b);

abs(I - S)