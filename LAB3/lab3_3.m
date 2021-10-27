
xv1 = [1,2,3,4,5];
yv1 = [1,1,2,6,24];

[X,L1] = buildInterpolation(4, xv1, yv1);
fig1 = plot(X,gamma(X),'-k',X,L1,'--r',xv1,yv1,'rd','MarkerFaceColor','r','MarkerSize',7);

approx = Lagrange_interpolation(6,xv1,yv1)
gamma(6)
norm(gamma(6) - approx,inf)