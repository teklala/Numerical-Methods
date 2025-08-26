t=[ 4 8 12 16 20 24];
c=[ 1600 1320 1000 890 650 560];
[a r2] = linregr(t, c);
m = a(1);
b = a(2);
syms T
C =@(T) m*T + b;
atZero = C(0);
display(atZero);
at200 =  (200 - b )/m ;
display(at200);
