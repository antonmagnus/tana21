function [t,y] = RungeKutta4(f,t0,T,y0,h)
	%%
	%  Classical four-stage Runge-Kutta time integration technique
	%  to solve the initial value problem
	%
	%     y' = f(t,y),  y(t0) = y0
	%
	%  INPUT:
	%
	%     f  - right-hand-side function that can depend on
	%          the time t and the function y
	%     t0 - intial time
	%     T  - final time
	%     y0 - initial solution value
	%     h  - fixed time step size
	%
	%  OUTPUT:
	%
	%     t - vector of time values
	%     y - solution vector of approximate values
	%
	%%
	%  discretize the time variable and set the problem size
    t = t0:h:T;
    y = zeros(length(t),1);
    %%
    %  save the intial values
    y(1) = y0;
    t(1) = t0;
    %%
    %  use Runge-Kutta 4 stage with the given timestep h to solve the problem and
    %  save the information for later analysis
    y_old = y0;
    for j = 2:length(t)
        k1 = f(t(j-1),y(j-1));
        k2 = f(t(j-1) + h/2, y(j-1) + (h/2) * k1);
        k3 = f(t(j-1)+ h/2, y(j-1) + (h/2) * k2);
        k4 = (f(t(j-1) + h, y(j-1) + h*k3));
        
        y(j) = y(j-1) + ((h/6) * (k1 + 2*k2 + 2*k3 + k4));
    end
end

