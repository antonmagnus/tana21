%f = @(x) 8*x.^3 - 4*x.^2 + 6*x - 3;
%g = @(x) sqrt(x);
%a = 1;
%b = 2;
%n = 4;


f2 = @(x) (x+1).^2.*cos((2*x+1)./(x-3.3));
I_true = integral(f2,0,3);

[I_adapt,x_adapt] = adaptiveSimpson(f2,0,3,1e-3);
abs(I_true - I_adapt)


[I10, x10] = SimpsonsRule(f2, 0, 3, 10);
[I20, x20] = SimpsonsRule(f2, 0, 3, 20);

plot_composite_quad(f2,x_adapt)

%loop = [2,4,8,16];
%prev_err = 1;
%for i = 1:length(loop)
%    [S, x] = SimpsonsRule(g, a, b, loop(i));
%    I_True = integral(g,a,b);
%    err = abs(I_True - S)
%    ratio = prev_err / err
%    prev_err = err;
%end


%syms x;
%g = 8*x^3 - 4*x^2 + 6*x - 3;

%I = int(g, a, b);


