t=[ 1 2 3.25 4.5 6 7 8 8.5 9 10];
v=[ 5 6 5.5 7 8.5 8 6 7 7 5];

dist =trapz(t, v);
avgVelo = dist / 10;

display(dist);
display(avgVelo);

%b
tn = 0:10;
p = polyfit(t, v, 3);
f = @(x)p(1)*x.^3 + p(2)*x.^2 +p(3)*x + p(4);
disp(f);
i = integral(f, 0, 10);
display(i);