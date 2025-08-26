teta= pi/4;
v0= 100*sqrt(2);
g = 10;
m =1;
b1 = 0;
b2 = 0.001;
b3 = 0.005;
vxinit = v0 * cos(teta);
vyinit = v0 * sin(teta);
y01 = [0,vxinit , 0, vyinit];
y02 = [0,vxinit , 0, vyinit];
y03 = [0,vxinit , 0, vyinit];
[t1,x1] = rk4sys(@dydt,tspan,y01,h,b1, m);
[t2,x2] = rk4sys(@dydt,tspan,y02,h,b2, m);
[t3,x3] = rk4sys(@dydt,tspan,y03,h,b3, m);

figure 
subplot(1, 2, 1);
plot(t3,x3(:, 1));
xlabel('t');
ylabel('x');

subplot(1, 2, 2);
plot(t3,x3(:, 3));
xlabel('t');
ylabel('y');


figure 
plot(x1(:, 1),x1(:, 3)); 
hold on
plot(x2(:, 1),x2(:, 3)); 
hold on
plot(x3(:, 1),x3(:, 3)); 
xlabel('x');
ylabel('y');
legend('b=0', 'b=0.001', 'b=0.005');

function yp = dydt(t,y, b, m)
    yp = [y(2); -b/m * y(2)^2; y(4); -10 - b/m * y(4)^2];
end