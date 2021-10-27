f = 1;
n = 100;
h = 1/(n-1);
nodes = 0 :h: 1;

f_1 = transpose([1,1,1,1,1]);
f_2 = transpose(nodes);
f_3 = transpose(nodes.*nodes);
f = f_3;
tol = 10e-6;

D = diag(-ones(n-1,1)/(2*h),-1) + diag(ones(n-1,1)/(2*h),1);

D(1,1) = -1/h;
D(1,2) = 1/h;
D(n,n) = 1/h;
D(n,n-1) = -1/h;

D_mod = diag(-ones(n-1,1)/(2*h),-1) + diag(ones(n-1,1)/(2*h),1);

D_mod(1,1) = -3/(2*h);
D_mod(1,2) = 4/(2*h);
D_mod(1,3) = -1/(2*h);
D_mod(n,n) = 3/(2*h);
D_mod(n,n-1) = -4/(2*h);
D_mod(n,n-2) = 1/(2*h);

%D = diag(1:n) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1)
f_der = zeros(n,1);
for i = 1:length(nodes)
    f(i) = exp(sin(4*nodes(i)));
    f_der(i) = 4* exp(sin(4*nodes(i)))*cos(4*nodes(i));
end

err = abs(f_der - (D_mod*f))
max(err)

