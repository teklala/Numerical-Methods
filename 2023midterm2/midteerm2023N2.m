
 x = [
1
2
3
5
8
];
y = [
 
0.8
1.9
2.2
3
3.5];


yn = y.^2;
xn = x.^0.5;
[a, r2] = linregr(xn, yn)