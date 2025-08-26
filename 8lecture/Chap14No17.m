
m = [400 
 70 
 45 
 2 
 0.3 
 0.16 ];
M = [
    270
 82
 50
 4.8
 1.45
 0.97];

[alfa, beta, r2] = powerModel(m, M);
display(alfa);
display(beta);
display(r2);

figure
%plot nontranformed
x =0:400;
y = alfa * x.^beta;
subplot( 2, 1, 1);
plot(x, y);

%plot transformed
xt =log10(x);
b =log10(alfa);
m = beta;
yt = b + m * xt;
subplot( 2, 1, 2);
plot(xt, yt);