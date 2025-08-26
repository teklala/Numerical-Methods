

%% Forward difference: Error vs h
f   = @(x) 7*x.^4;
f_p = @(x) 28*x.^3;

h=[0.16 0.08 0.04 0.01];
%h=0.01:0.01:0.16;
x=3;
f_approx = (f(x+h)-f(x))./h;
f_true=f_p(x);
E=abs((f_approx-f_true)/f_true)*100;
plot(h,E)
hold on

%% Backwards difference: Error vs h
f_approx = (f(x)-f(x-h))./h;
f_true=f_p(x);
E=abs((f_approx-f_true)/f_true)*100
plot(h,E)

%% Central Difference: Error vs h
f_approx = (f(x+h)-f(x-h))./(2*h);
f_true=f_p(x);
E=abs((f_approx-f_true)/f_true)*100
plot(h,E)
legend('forward difference','backward difference','central difference')


%% Second Derivative
x=2;
h=0.64;
%h=[0.01:0.01:0.64] % to see that error goes down quadratically
f_p2 = @(x) 3*28*x.^2;
f_approx = (f(x+h)-2*f(x)+f(x-h))./(h.^2)
f_true=f_p2(x)
E=abs((f_approx-f_true)/f_true)*100
plot(h,E)

%% Richardson Extrapolation
f_true=0.7449;
f_r = @(x) 5*x.*exp(-2.*x);
h=[0.5 0.25 0.125 0.0625] ;
x=0.35;
A_h =(f_r(x+h)-f_r(x-h))./(2*h);
A_h2=(f_r(x+h/2)-f_r(x-h/2))./(h);
T=(1/3)*(4*A_h2-A_h)


%% MATLAB IMPLEMENTAION diff gradient
% diff returns differences of vector elements
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
x = 0:0.1:0.8;
y = f(x);
d= diff(y)./diff(x)
% If the x grid is equally spaces we could simply divide by the segment
% length
d1=diff(f(x))/0.1;
% d (and d1) contain the derivative estimates 
% at midpoints
n = length(x);
xm = (x(1:n -1)+x(2:n))./2; %vector of midpoints


% Analytical Derivative
xa = 0:.01:.8;
ya = 25 - 400*xa + 3*675*xa.^2 - 4*900*xa.^3 + 5*400*xa.^4;

plot(xm,d,'o',xa,ya)

%% Other uses of diff
x=[1 2 3 4 5 7]
diff(x)
%check for unequal spacing 
if any(diff(diff(x)) ~= 0), error('unequal spacing'), end

%%
x=[1 2 3 4 5 2]

% ascending or descending vector
if any(diff(x) <= 0), error('not in ascending order'), end

%% gradient
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
x = 0:0.1:0.8;
y = f(x);
dy = gradient(y,0.1) % uses interval 2*0.1
xa = 0:.01:.8;
ya = 25 - 400*xa + 3*675*xa.^2 - 4*900*xa.^3 + 5*400*xa.^4;
plot(x,dy,'o', xa,ya)

%% 2D gradiient
x = -2:0.1:2;
y = x';
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z);

[X,Y]=meshgrid(x,y)


figure
subplot(1,2,1)
surf(X,Y,z)
subplot(1,2,2)
contour(x,y,z)
hold on
quiver(x,y,px,py)
hold off

%%

k=[0:100]; n=k';
a=sin(k).*sin(n)



%%
x=2;
h=0.5;

f = [0.05 0.12952 0.24197 0.35207 ...
    0.39894 0.35207 0.24197 0.12952 0.05399];

f_approx = (f(3:end)-2*f(2:(end-1))+f(1:(end-2)))./(h.^2)

