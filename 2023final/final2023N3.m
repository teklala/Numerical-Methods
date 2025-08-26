 tspan = [0 10];
 h = 0.1;
 y0 = [0 -1];

[t,x] = rk4sys(@ODEFUN,tspan,y0,h);
%display(x);
%subplot(1,2,1);
plot(t, x(:,1));
%title("y with ranga");
%subplot(1,2,2);
%plot(t, x(:,2));
%title("derivative of y");
hold on
[t,x] = eulodesystem(@ODEFUN,tspan,y0,h);
display(x);
plot(t, x(:,1));
%title("y with euler");

function yp = ODEFUN(t, y)
    yp = [y(2); exp(-t * y(1))];
end