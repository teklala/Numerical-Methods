function [t,y] = eulode (dydt,tspan,y0,h,varargin)
% eulode: Euler ODE solver
% [t,y] = eulode (dydt,tspan,y0,h,p1,p2,...):
% uses Euler's method to integrate an ODE
% input:
% dydt = name of the M?file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size
% p1,p2,... = additional parameters used by dydt
% output:
% t = vector of independent variable
% y = vector of solution for dependent variable
if nargin < 4
    error('at least 4 input arguments required')
end

ti = tspan(1);
tf = tspan(2);
t = ti:h:tf;
n = length(t);
y = ones( 1, n); % 1 row da n+1 sveti
y(1, 1) = y0;
yprev = y0;
for i=1:n-1
    y(1, i+1) = yprev + h * dydt(t(i), yprev, varargin{:});
    yprev = y(1, i+1);
end
y = y';
t = t';

end

