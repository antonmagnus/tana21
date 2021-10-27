function [pnx] = Lagrange_interpolation(z,xVals, yVals)
%%
%  Implementation to evaluate an interpolating polynomial p_n(x) 
%  at the point x = z. The polynomial uses the standard Lagrange
%  basis functions.
%
%  INPUT:
%
%     z    - 1x1 value to evaluate
%     ???
%
%  OUTPUT:
%
%     pnx - value of the polynomial interpolant at x = z
%

%%
%  compute the polynomial interpolation sum evaluated at x = z
   L = zeros(1);
   pnx = 0;
   for i = 1:length(xVals)
       x_i = xVals(i);
       y_i = yVals(i);
       L(i,:) = 1;
      for j = 1:length(xVals)
        if i~=j
            L(i,:) = L(i,:).*(z-xVals(j))/(x_i-xVals(j));
        end
      end
      pnx = pnx + L(i,:)*y_i;
   end
end
