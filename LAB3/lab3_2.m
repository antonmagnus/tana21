
xv1 = [-1,0,1];
yv1 = [2,0,2];

xv2 =[-1,0,1,1.5];
yv2 = [-6,-3,0,3.375];

func1 = @(x) 2*x.^2;
[X,L1] = buildInterpolation(150, xv1, yv1);
fig1 = plot(X,func1(X),'-k',X,L1,'--r',xv1,yv1,'rd','MarkerFaceColor','r','MarkerSize',7);
norm(func1(X) - L1,inf)

hold

func2 = @(x) x.^3 + 2*x -3;
[X,L2] = buildInterpolation(150, xv2, yv2);
fig2 = plot(X,func2(X),'-k',X,L2,'--r',xv2,yv2,'rd','MarkerFaceColor','r','MarkerSize',7);
norm(func2(X) - L2,inf)