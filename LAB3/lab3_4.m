x_joukow = [-1.7550, -1.7400, -1.6960, -1.6010, -1.4830, -1.2950, -1.0430, -0.8354, -0.5833, -0.2872, 0.1997, 0.8372, 1.3570,  1.69500];
y_joukow = [ 0.0893,  0.1461,  0.2196,  0.3199,  0.4088,  0.5115,  0.6042,  0.6529,  0.6852,  0.6903, 0.6297, 0.4284, 0.1643, -0.04687];
[L,X] = buildInterpolation(150, x_joukow,y_joukow);
plot(X,L,'--r',x_joukow,y_joukow,'rd','MarkerFaceColor','r','MarkerSize',7);

%X = linspace(-1.775,1.695,150);
%s = spline(x_joukow,y_joukow,X);
%plot(X,s,'-.g','LineWidth',2)