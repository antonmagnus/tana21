% known bounderies
y0 = 1;
y_end = 1/exp(1);
end_node = (3*pi)/2;

% matrix for saveing errors 
errors = zeros(1,4);
% keeping track of modes
modes = [10,20,40,80];

for j = 1:length(modes)
    
    % setting the number of nodes
    n = modes(j);
    % calc distance between nodes
    h = end_node/(n-1);
    % creating an array with nodes
    nodes = 0:h:end_node;
    % creating matrix for a, b and exact values to be stored
    a = zeros(n-2,1);
    b = zeros(n-2,1);
    exact = zeros(1,1);
    
    % centeral difference approximations
    % start loop on n+1 and end at n-1
    for i = 2:length(nodes)-1
        
        % the factor for f_i+1 
        f_forw = (-cos(nodes(i))*h/2)+1;
        % the factor for f_i 
        fi = -2+((h^2)*sin(nodes(i)));
        % the factor for f_i-1 
        f_back = (cos(nodes(i))*h/2)+1;

        % add the values to the a matrix
        a(i-1,i-1) = f_back;
        a(i-1,i) = fi;
        a(i-1,i+1) = f_forw;
        
        % calculate the exact value for the node 
        % based on the known solution
        exact(i-1,1) = exp(1)^sin(nodes(i));
    end
    % move the top left value to the b (rhs) matrix
    % and factor in the know quants.
    b(1,1) = -1 * a(1,1) * y0;
    
    % remove the left column
    a(:,1) = [];

    % move the bottom right value to the b (rhs) matrix
    % and factor in the know quants.
    b(n-2,1) = -1 * a(n-2,n-1) * y_end;
    
    % remove the right column
    a(:,n-1) = [];

    % set tolerance for the SOR
    tol = 10e-11;
    
    % set the relaxation parameter
    w = 1.9;
    
    % Use sor to solve the linear equation
    [t,k] = sor(a,b,zeros(n-2,1),w,tol);

    % add the biggest absolute error to the error matrix
    errors(j) = max(abs(t - exact));
end

% The following code was only used to find an optimal relaxation parameter

save = zeros(1,1);
count = 1;
t = [];
for w = 1:0.01:2
    [t,k] = sor(a,b,zeros(n-2,1),w,tol);
    save(1,count) = k;
    save(2,count) = w;
    count = count+1;
end

x = save(2,:);
y = save(1,:);

plot(x,y);






