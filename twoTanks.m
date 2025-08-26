TSPAN= [0 20];
y0 = [0 0  ];

[t,y] = ode45(@ODEFUN,TSPAN,y0) ;
%display(y);
plot(t,y(:, 1));
hold on
plot(t,y(:, 2));
x2f = y(:, 2)  
  
  function yp = ODEFUN(t, y)
    yp= [1.5*0.2 - 2*y(1)/(10 - 0.5*t);  2*y(1)/(10-0.5*t)-2.5*y(2)/(20 - 0.5*t)];
    
  end