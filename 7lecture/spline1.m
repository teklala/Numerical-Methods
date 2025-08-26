function [a,b]=spline1(x,y)

k = length(x)-1;
for i = 1:k
    a(i) = (y(i)-y(i+1))/(x(i)-x(i+1));
    b(i) = (y(i+1)*x(i) - y(i)*x(i+1))/(x(i)-x(i+1));
end

figure
hold on
plot(x,y,'LineWidth',2)
plot(x,y,'ok','MarkerSize',5,'MarkerFaceColor','k')
xlabel('x')
ylabel('y')
title('Linear Spline Interpolation')

fprintf('\n       ai         bi       \n')
fprintf('%10.3f %10.3f\n',[a',b']);
