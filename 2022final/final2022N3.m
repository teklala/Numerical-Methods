x =[
0
1
3];
c =[
0.06
0.32
0.6];

p = polyfit(x, c, 2);
display(p);

%syms t
f = p(1) * t^2 + p(2)*t + p(3);
%diff(f,t)

dfunc = @(t)3/10 - (2*t)/25;
a = dfunc(0);
display(a);

dab =a * 1.5 * 3600 * 3.6 * 10^6;
display(dab);