function [alfa, beta, r2] = powerModel(x, y)

yn = log10(y);
xn = log10(x);

[a r2] = linregr(xn, yn);
m = a(1);
b= a(2);
beta = m;
alfa = 10^b;



end

