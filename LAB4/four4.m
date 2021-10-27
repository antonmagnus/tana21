f = @(t,y) 5./t - 1./(t.^2) - 5*t.*y.^2;
t0 = 1;
T = 25;
y0 = 1;
h = 0.1;
[~, yR] = RungeKutta4(f,t0,T, y0, h);
[~, yF] = forwardEuler(f,t0,T, y0, h);

yR(end)
yF(end)

%err = abs(0.04 - y(end))





