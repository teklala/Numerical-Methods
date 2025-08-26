% step size, timespan and IVs
h = 0.05; tspan = [0 40]; y0 = [1 -1 2 0];

m1 = 1; m2 = 2; k1=1; k2=1; k3=10;

figure(2)
[t x] = rk4sys(@mass_spring,tspan,y0,h,m1,m2,k1,k2,k3);
subplot(2,1,1)
plot(t,x(:,1), t,x(:,3))
title('position')
subplot(2,1,2);
plot(t,x(:,2), t,x(:,4))
title('velocity')

function yp = mass_spring(t,y,m1,m2,k1,k2,k3)
yp = [ y(2);
       -((k1+k2)/m2)*y(1) + (k2/m1)*y(3); 
      y(4);
      -((k2+k3)/m2)*y(3) + (k2/m2)*y(1)
      ];
end