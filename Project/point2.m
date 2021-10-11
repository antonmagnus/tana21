% known quant
y0 = 1;
y_end = 1/exp(1);

% num of nodes
n = 7;
end_node = (3*pi)/2;
h = end_node/(n-1);
nodes = 0:h:end_node;
a = zeros(n-2,1);
b = zeros(1,1);
c = zeros(1,1);
y = zeros(1,1);
exact = zeros(1,1);
% unknown quants
% full ODE f_biz = cos(x)*f_prim-sin(x)*y;
% f_prim = (f(nodes(i+1)) - f(nodes(i-1))) / (2*h);
% f_biz = (f(nodes(i+1)) - 2*f(nodes(i)) + f(nodes(i-1))) / (h^2);

for i = 2:length(nodes)-1
    f_forw = (cos(nodes(i))*h/2)+1;
    fi = 2-h^2;
    f_back = -(cos(nodes(i))*h/2)-1;
    
    a(i-1,i-1) = f_back;
    a(i-1,i) = fi;
    a(i-1,i+1) = f_forw;
    
    c(i-1,1) = h^2 * -1 * sin(nodes(i));
    exact(i-1,1) = exp(1)^sin(nodes(i));
end

b(1,1) = -1 * a(1,1) * y0;
a(:,1) = [];

b(n-2,1) = -1 * a(n-2,n-1) * y_end;
a(:,n-1) = [];

b = b + c;

tol = 10e-11;
save = zeros(1,1);
count = 1;
t = [];
for w = 1:0.01:2
    [t,k] = sor(a,b,zeros(n-2,1),w,tol);
    save(1,count) = k;
    save(2,count) = w;
    count = count+1;
end
