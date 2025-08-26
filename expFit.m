function [b, m] = expFit(x, y)

[a, r2] = linregr(x-1900,log(y));

m = a(1);
b = exp(-m*1900 + a(2));
end

