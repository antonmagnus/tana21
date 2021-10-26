f = @(x) 8*x.^3 - 4*x.^2 + 6*x - 3;
g = @(x) sqrt(x);
a = 1;
b = 2;
n = 4;




loop = [2,4,8,16];
prev_err = 1;
for i = 1:length(loop)
    [S, x] = SimpsonsRule(g, a, b, loop(i));
    I_True = integral(g,a,b);
    err = abs(I_True - S)
    ratio = prev_err / err
    prev_err = err;
end


%syms x;
%g = 8*x^3 - 4*x^2 + 6*x - 3;

%I = int(g, a, b);


