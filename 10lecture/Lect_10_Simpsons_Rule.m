%% Lect 10 - Simpson's Rules

%% Ex: f(x)=5xe^-2x; (1/3 rule)
f = @(x) 5.*x.*exp(-2.*x);
a=0.1; b=1.3;
h=(a-b)/2;

A = [1 a a^2; 1 (a+b)/2 ((a+b)/2)^2; 1 b b^2];
b = f([a (a+b)/2 b]');
a_coeff=A\b;

x=0.1:0.01:1.3;
plot(x,f(x),'b','linewidth',1.2)
hold on
plot(x, polyval(flip(a_coeff), x),'linewidth',1.2)
legend('f(x)','f_2(x)')
grid on

%% Ex2: f(x)=x^-x 6-segment (try n=2,4,10,20,100) Simpson 1/3 rule;
trueVal=0.8751;
Error=[]
for n=2:2:20
    a=0.2; b=3.8; h=(b-a)/n;
    f = @(x) x.*exp(-x);
    x=a:h:b;
%
    I=(h/3)*(f(a)+4*sum(f(x(2:2:n)))+2*sum(f(x(3:2:n-1)))+f(b))
    Error(n/2)=abs((trueVal-I)/trueVal)*100
    
end
n=2:2:20;
plot(n,log(Error),'*--')
title('e_{ragac}^{3x}')
%% Unequal Segments Trapezoidal Method

x = [0 .12 .22 .32 .36 .4 .44 .54 .64 .7 .8];
y = 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
trapuneq(x,y)

%% MATLAB Implementation TRAPZ

x = [0 .12 .22 .32 .36 .4 .44 .54 .64 .7 .8];
y = 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
trapz(x,y)

%% cumulative integral cumtrapz

x = [0 .12 .22 .32 .36 .4 .44 .54 .64 .7 .8];
y = 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
z = cumtrapz(x,y)

%% Unequal Segment Trap Integration Function
function I = trapuneq(x,y)
% trapuneq: unequal spaced trapezoidal rule quadrature
% I = trapuneq(x,y):
% Applies the trapezoidal rule to determine the integral
% for n data points (x, y) where x and y must be of the
% same length and x must be monotonically ascending
% input:
% x = vector of independent variables
% y = vector of dependent variables
% output:
% I = integral estimate
if nargin<2,error('at least 2 input arguments required'),end
if any(diff(x)<0),error('x not monotonically ascending'),end
n = length(x);
if length(y)~= n,error('x and y must be same length'); end
s = 0;
for k = 1:n-1
    s = s + (x(k+1) - x(k))*(y(k)+ y(k +1))/2;
end
I = s;
end