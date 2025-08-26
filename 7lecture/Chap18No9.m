T=[ 0 8 16 24 32 40];
o=[ 14.621 11.843 9.870 8.418 7.305 6.413];
Tn = 0:0.1:41;
p = polyfit(T, o, 5);
v = polyval(p, 27);
y = polyval(p, Tn);
display(v);
plot(Tn, y);