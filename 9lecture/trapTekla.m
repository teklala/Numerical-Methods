function [integral] = trapTekla(func,a, b, n, varargin)
if nargin < 3
    error ('not enough arguments');
end 
if nargin<4
    n = 100;
end

h = (b - a)/n;
integral = 0;

for i=1:n
    fa = func(a, varargin{:});
    fb = func(a+h, varargin{:});
    integral = integral + h * (fa+fb)/2;
    a = a + h;
    
end

end

