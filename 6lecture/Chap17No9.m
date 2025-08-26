x =[0 1 2 3 4 5];
f=[ 0 0.5 0.8 0.9 0.941176 0.961538];
p1 = polyfit(f, x, 2);
p2 = polyfit(f, x, 3);
v1 = polyval(p1, 0.93);
v2 = polyval(p2,0.93);
display(v1);
display(v2);