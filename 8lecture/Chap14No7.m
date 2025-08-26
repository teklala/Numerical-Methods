

n = 35.7;
T=[ -40 0 40 80 120 160] + 273;
p = [6900 8100 9350 10500 11700 12800];

[a r2] = linregr(T, p);

display(a);
display(r2);
m = a(1);
b = a(2);
p = m*T + b;
Tn = 273:1:433;
R = 10^3 * (m*Tn + b)./(n*Tn);


%with average

%R= p*10^3./(n * T);
display(R);

sum = 0;
for i=1: length(R)
    sum = sum + R(i);
end
avg = sum/length(R);
display(avg);


%with m
r =  m *1000/n;
display(r);