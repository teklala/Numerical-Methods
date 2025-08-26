x =[0 2 4 6 9 11 12 15 17 19];
y=[5 6 7 6 9 8 8 10 12 12];

[a r2] = linregr(x, y);
display(r2);

xn = 0:20;
p = polyfit(x, y, 1);
f = polyval(p, xn);
figure
plot(xn, f, 'g-');


figure
[b r3] = linregr(y, x);
display(r3);
