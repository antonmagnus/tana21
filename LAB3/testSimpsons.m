f = @(x) 8*x^3 - 4*x^2 + 6*x - 3;
[S, x] = SimpsonsRule(f, -4, 2, 2);