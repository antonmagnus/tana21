function [S,x] = SimpsonsRule(f,a,b,n)
    %%
    %  Implementation of the (possibly) composite Simpsons's quadrature
    %  rule to approximate the definite integral
    %
    %           b
    %          /\
    %          |
    %          | f(x) dx
    %          |
    %         \/
    %         a
    %
    %  INPUT:
    %
    %     f    - anonymous function integrand
    %     a    - lower integration bound
    %     b    - upper integration bound
    %     n    - number of intervals (must be an even integer)
    %
    %  OUTPUT:
    %
    %     In - approximation to the definite integral on the given interval [a,b]
    %     x  - set of n+1 quadrature nodes
    %
    %%
    %  Simpson's rule needs at least two intervals
    if n == 1
        error('Simpsons rule requires n >= 2');
    end
    %%
    %  check if the number of intervals is even
    if mod(n,2) ~= 0
        error('The number of intervals n must be even');
    end
    %%
    %  Find the interval spacing h
    h = (b - a) / n;

    %%
    %  build the set of uniformly spaced quadrature nodes
    x = zeros(n+1,1);

    x(1) = f(a);
    x(2) = 4*f((b+a)/2);
    x(3) = f(b);

    %for i = 1:n+1
    % TODO: Later for composite
    %end


    %%
    %  Initialize the integral value to zero
    S = 0.0;
    %%
    %  Approximate the integral with (composite) Simpson's rule

    for i = 1:n+1
        S = S + ((h/3)*x(i));
    end

end

