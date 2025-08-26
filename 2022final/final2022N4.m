k1 = 2;
k2 = 3;
k3 = 1;
m1 = 2;
m2 = 1;
tspan=[0 5];
y0 = [0.1 0 0 -0.5];
[tp,yp] = ode45(@dydt,tspan,y0, [], k1, k2, k3, m1,m2);
%display(yp);

figure 
plot(tp, yp(:, 1));
hold on
plot(tp, yp(:, 3));
%figure
d = yp(:, 1) - yp(:, 3);
%display(d);
%plot(tp, d);
mnd =min(abs(d));
display(mnd);
mnd
function yp = dydt(t, y, k1, k2, k3, m1, m2)

    yp = [y(2); (y(1) * (-k1-k2) + k2* y(3))/m1; y(4); (y(3) * (-k3-k2)+ k2 * y(1))/m2];
end