%%
N = 5;
A = full(gallery('tridiag',N,-1,2.1,-1));
known_x = ones(N,1); % make known solution vector of 1s
manuf_b = A*known_x; % manufacture the right-hand-side
tol = 10e-11;
save = zeros(1,1);
c = 1;
for w = 1:0.001:2
    [~,k] = sor(A,manuf_b,zeros(N,1),w,tol);
    save(1,c) = k;
    save(2,c) = w;
    c = c+1;
end
%%
loglog(save(2,:),save(1,:))