t=[
0
5
10
15
20];

p=[
96
212
433
975
2048
];

[a, r2] = linregr(t,log(p)); %exponenciali
[b, r3] = linregr(log10(t+eps),log10(p)); %xarisxovani
display(r2);
display(r3);

%anu exsponenciali 1 tan axlosaa
k = exp(a(2));
m = a(1);
y = k * exp(m * 25);
display(y);
