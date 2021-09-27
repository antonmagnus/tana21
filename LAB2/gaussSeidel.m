function [x,k] = gaussSeidel(A,b,x0,tol)
%%
%  Gauss-Seidel iterative method to approximate the solution of a
%  linear system Ax=b up to a user defined tolerance
%
%  INPUT: 
%    A   - n by n square, non-singular matrix
%    b   - n by 1 right hand side vector
%    x0  - n by 1 vector containing that initial guess for the iteration
%    tol - user set tolerance for the stopping condition in the iteration 
%
%  OUTPUT:
%    x - n by 1 vector containing the iterative solution
%    k - number of iterations
%%
%  get the system size
   n = length(A);
%%
%  Gauss-Seidel iteration which overwrites the current approximate solution
%  with the new approximate solution (pseudocode available in the lecture
%  notes on page 46)
%
%%
    max_its = 250;
    x = linspace(0,0,n);
    for k = 1:max_its
        for i = 1:n
            sum = 0;
            for j = 1:n
                if j~=i
                    sum = sum + A(i,j)*x0(j);
                end
            end
            x(i) = (b(i) -sum)/A(i,i);
        end
        r = b-A.*x0;
        if norm(r)< (tol * norm(b))
            break;
        end
    end
end