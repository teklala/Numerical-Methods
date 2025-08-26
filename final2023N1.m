%% a 
x = linspace(-2, 4,9); % 8 interbali 9 wertili
y = @(x )(-2)*x.^5-4*x.^3-x-1 ;
f0 = y(-2);
fn = y(4);
s1 = sum(y(2:2:8)); %kentebi indexebi 1dan anu
s2 = sum(y(3:2:7)); %luwebi indxi 2dan 
I = (4 - (-2))* (f0+4*s1 + 2*s2+fn)/(3*8);
display(I);
f = (-2)*x.^5-4*x.^3-x-1 ;
plot(x,f);


%% b
x = 0:10^-7:0.02;
f =@(x) 1./sqrt(x)  - 4*10^5 * sqrt(x) +0.4;
idx = find(f(x) >-10^-6);  % Find indices where f(x) ? 0
root = x(idx);  % Get corresponding x values
display(root);
[root2,fx,ea,iter]=bisect(f,0,0.02,10^-5);
display(root2);




function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4||isempty(es), es=0.0001;end
if nargin<5||isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
while (1)
xrold = xr;
xr = (xl + xu)/2;
iter = iter + 1;
if xr ~= 0,ea = abs((xr - xrold)/xr) * 100;end
test = func(xl,varargin{:})*func(xr,varargin{:});
if test < 0
xu = xr;
elseif test > 0
xl = xr;
else
ea = 0;
end
if ea <= es || iter >= maxit,break,end
end
root = xr; fx = func(xr, varargin{:});
end


%% c


