
% step size, timespan and IVs
h = 0.05; tspan = [0 40]; x0 = [20 1];
% parameters
a = 1.2; b = 0.6; c = 0.8; d = 0.3;

%% Euler

[t x] = eulodesystem(@predprey,tspan,x0,h,a,b,c,d);
subplot(2,1,1)
plot(t,x(:,1), t,x(:,2))
legend('prey', 'predator')
title('time plot')
subplot(2,1,2);plot(x(:,1),x(:,2))
axis square
title('phase plane plot')

%% RK4
figure(2)
[t x] = rk4sys(@predprey,tspan,x0,h,a,b,c,d);
subplot(2,1,1)
plot(t,x(:,1), t,x(:,2))
legend('prey', 'predator')
title('time plot')
subplot(2,1,2);plot(x(:,1),x(:,2))
axis square
title('phase plane plot')

function xp = predprey(t,x,a,b,c,d)
xp = [ a*x(1) - b*x(1)*x(2); 
      -c*x(2) + d*x(1)*x(2)];
end