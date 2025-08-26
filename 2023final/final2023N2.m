t=4:0.2:8;
h =0.2;
x =[
5.87
4.34
2.55
0.89
0.67
2.09
3.31
4.31
5.06
5.55
5.78
5.77
5.52
5.08
4.46
3.72
2.99
2.00
1.10
0.23
0.59];


x5 = find(t==5);
x6 = find(t==6);
d1 = ( x(x5 + 1) - x(x5))/h;
d2 = ( x(x6 + 1) - x(x6))/h;
display(d1);
display(d2);
n = length(t);
v = ones(1, n);
v(1, 1 ) = (x(2) - x(1))/h; %pirveli wevri kidrua
v(1, n) = (x(n) - x(n-1))/h;  %bolo wevri
v(1, (2:n-1)) = (x(3:n) - x(1:n-2))/(2*h);

a = ones(1, n);
a(1, 1 ) = (v(2) - v(1))/h; %pirveli wevri kidrua
a(1, n) = (v(n) - v(n-1))/h;  %bolo wevri
a(1, (2:n-1)) = (v(3:n) - v(1:n-2))/(2*h);


subplot(1, 3, 1);
plot(t, x);
title("coordinate");
subplot(1, 3, 2);
plot(t, v);
title("velocity");
subplot(1, 3, 3);
plot(t, a);
title("accelaration");


