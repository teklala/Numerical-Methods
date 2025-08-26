x =[0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.015 2.54 8];
p = polyfit(x, y, 6);
plot(x, y, 'ro');
hold on
o = polyval(p, x);
plot(x, o, 'b-');
s = polyval(p, 3.5);
display(s);