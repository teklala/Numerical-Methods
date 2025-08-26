vinit = 10;
vin = 0.5;
cin = 0.2;
vout = 1;
h=0.01;
y0 = 0;
tspan = [0 20];
[t,y] = eulode (@dmdt,tspan,y0,h, vinit, vin, cin, vout);
plot(t, y);
m = max(y);
display(m);
index = find(y==m);
time =t(index);
display(time);


function yp = dmdt(t,m, vinit, vin, cin, vout )
yp = vin *cin - m/(vinit + (vin - vout)*t) * vout;
end