T=[
0
8
16
24
32
];
c=[
14.621
11.843
9.870
7.305
6.413

];

t = 0:1:32;

plot(T, c, 'r-');
hold on
i = interp1(T,c,t);
v1 = interp1(T, c, 27);
plot(t,i, 'b-');


p= polyfit(T, c, 5);
q = polyval(p,t);
v2 = polyval(p, 27);
plot(t, q, 'g-')


cubic = interp1(T,c,t, 'spline');
v3 = interp1(T, c, 27);
plot(t,cubic, 'm-');
display(v1);
display(v2);
display(v3);
hold off

