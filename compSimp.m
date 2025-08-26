function [I] = compSimp(func, a, b, n)
h = (b - a)/n;
x = a:h:b; %n+1
v1 = x(2:2:n-1+1); %kentebi
v2 = x(3:2:n-2+1); % luwebi
f1 = func(v1);
f2 = func(v2);
s1 = 4 * sum (f1);
s2 = 2* sum(f2);

I = (b - a) * (func(a) + s1+s2+ func(b))/(3*n);
end

