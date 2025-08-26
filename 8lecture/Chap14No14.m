c=[ 0.5 0.8 1.5 2.5 4];
k=[1.1 2.5 5.3 7.6 8.9];

kn = 1./k;
cn = (1./c).^2;

[a r2] = linregr(cn, kn);
m = a(1);
b = a(2);
kmax = 1/b;
cs = m/b;

%display
display(m);
display(b);
display(r2);
display(kmax);
display(cs);

%predict

syms x
f =@(x) kmax*x^2 /(cs + x^2);
pred = f(2.5);
display(pred);

otherpred =1/(b + m*0.16);
display(otherpred);
