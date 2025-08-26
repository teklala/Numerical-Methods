function coeffs = spline3(x,y)

k = length(x); % number of data points
n = 4*(k-3);    % number of equations/unknowns

A = zeros(n);
b = zeros(n,1);

b(1:3) = y(1:3);
b((2*(k-3)):(2*(k-3)+2)) = y(k-2:k);
for i = 4:2*(k-3)-1
    if mod(i,2)==1
        b(i) = y((i+3)/2);    % if i is odd
    else
        b(i) = y(i/2+1);    % if i is even
    end
end

% Create the matrix of coefficients [A]
A(1,1:4)=[1 x(1) x(1).^2 x(1).^3];
A(2,1:4)=[1 x(2) x(2).^2 x(2).^3];
A(3,1:4)=[1 x(3) x(3).^2 x(3).^3];
for i=4:k-1
    A(2*i-4,4*(i-3)+1) = 1;           % ai
    A(2*i-4,4*(i-3)+2) = x(i-1);      % bi
    A(2*i-4,4*(i-3)+3) = x(i-1)^2;    % ci
    A(2*i-4,4*(i-3)+4) = x(i-1)^3;    % di

   A(2*i-3,4*(i-3)+1) = 1;         % ai
   A(2*i-3,4*(i-3)+2) = x(i);      % bi
   A(2*i-3,4*(i-3)+3) = x(i)^2;    % ci
   A(2*i-3,4*(i-3)+4) = x(i)^3;    % di
end
A((2*(k-3)),(4*k-15):(4*k-12))=[1 x(k-2) x(k-2).^2 x(k-2).^3];
A((2*(k-3)+1),(4*k-15):(4*k-12))=[1 x(k-1) x(k-1).^2 x(k-1).^3];
A((2*(k-3)+2),(4*k-15):(4*k-12))=[1 x(k) x(k).^2 x(k).^3];

for i=1:k-4
    A(2*(k-3)+2+i,4*(i-1)+1+1) = 1;
    A(2*(k-3)+2+i,4*(i-1)+1+5) = -1;
        
    A(2*(k-3)+2+i,4*(i-1)+1+2) = 2*x(i+2);
    A(2*(k-3)+2+i,4*(i-1)+1+6) = -2*x(i+2);
    
    A(2*(k-3)+2+i,4*(i-1)+1+3) = 3*x(i+2)^2;
    A(2*(k-3)+2+i,4*(i-1)+1+7) = -3*x(i+2)^2;    
end

for i=1:k-4          
    A(3*k-8+i,4*(i-1)+1+2) = 2;
    A(3*k-8+i,4*(i-1)+1+6) = -2;
    
    A(3*k-8+i,4*(i-1)+1+3) = 6*x(i+2);
    A(3*k-8+i,4*(i-1)+1+7) = -6*x(i+2);    
end

coeffs = A\b;

% The rest is only for plotting
xplot = linspace(min(x),max(x));
yplot = zeros(1,length(xplot));
for i=1:length(xplot)
    for j = 3:k-1
        if xplot(i)<=x(j)
            yplot(i)=coeffs(4*(j-3)+1)+coeffs(4*(j-3)+2)*xplot(i)+coeffs(4*(j-3)+3)*xplot(i)^2+coeffs(4*(j-3)+4)*xplot(i)^3;
            break
        end
    end
    if xplot(i)>x(k-1)
        yplot(i)=coeffs(n-3)+coeffs(n-2)*xplot(i)+coeffs(n-1)*xplot(i)^2+coeffs(n)*xplot(i)^3;
    end
    
end
    
figure(1)
hold on
plot(xplot,yplot,'LineWidth',2)
plot(x,y,'ok','MarkerSize',7,'MarkerFaceColor','k')
xlabel('x')
ylabel('y')
title('Cubic Spline Interpolation')

fprintf('\n    Coeffs\n');
fprintf('%10.3f\n',coeffs);