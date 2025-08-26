%% Lect 13-14 - Euler's Method

%% Ex1: dy/dx+0.4y=3e^-x; y(0)=5; y(3)=?

h=0.1;
x=0:h:3;
f = @(x,y) 3*exp(-x)-0.4*y;
y=[];
y(1)=5;
for i=1:(length(x)-1)
    
    y(i+1)=y(i)+f(x(i),y(i))*h;
    
end

y
y_exact = @(x) 10*exp(-0.4.*x)-5*exp(-x);
plot(x,y_exact(x))
hold on
plot(x,y,'o')
grid on
legend('True Solution','Euler Approximation')
title("step size h="+ h)

%% Example of using eulode
dydt = @ (t,y) 4*exp(0.8*t) - 0.5*y;
[t,y] = eulode(dydt,[0 4],2,1);
disp([t,y])
plot(t,y)
grid on

% There will be more complex problems where the
% definition of the ODE requires several lines
% of code. Insuch instances, creating a separate
% M-file is the only option.


%% Modified Euler Method - Heun

h=0.01; %compare to reglar euler 
x=0:h:3;
f = @(x,y) 3*exp(-x)-0.4*y;
y=[];
y(1)=5;
for i=1:(length(x)-1)
    y_0 = y(i)+f(x(i),y(i))*h; % predictor
    y(i+1)=y(i)+(f(x(i),y(i))+f(x(i+1),y_0))*(h/2);
    
end

y
y_exact = @(x) 10*exp(-0.4.*x)-5*exp(-x);
plot(x,y_exact(x))
hold on
plot(x,y,'o')
grid on
legend('True Solution','Modified Euler Approximation ')
title("step size h="+ h)


%% Euler Method Function
function [t,y] = eulode (dydt,tspan,y0,h,varargin)
% eulode: Euler ODE solver
% [t,y] = eulode (dydt,tspan,y0,h,p1,p2,...):
% uses Euler's method to integrate an ODE
% input:
% dydt = name of the M-file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size
% p1,p2,... = additional parameters used by dydt
% output:
% t = vector of independent variable
% y = vector of solution for dependent variable
if nargin < 4,error('at least 4 input arguments required'),end
ti = tspan(1);tf = tspan(2);
if ~(tf > ti),error('upper limit must be greater than lower'),end
t = (ti:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf
    t(n + 1) = tf;
    n = n + 1;
end
y = y0*ones(n,1); %preallocate y to improve efficiency
for i = 1:n - 1 %implement Euler's method
    y(i + 1) = y(i) + dydt(t(i),y(i),varargin{:})*(t(i + 1) - t(i));
end
end