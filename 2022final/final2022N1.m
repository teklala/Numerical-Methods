%% a
func = @(x)(x/5)^2 + (1/(8 * x)^2) - 1;
dfunc = @(x)(2*x)/25 - 1/(32*x^3);
xr = 4;
[root,ea,iter] = newtraph(func,dfunc,xr,10^-5);
display(root);

%% b
%x =-2:0.01:3;
func =@(x) x - 2^(-x);
[root,fx,ea,iter]=bisect(func,-1,1,10^-5);
display(root);

%% c
n = 6;
x = linspace(1, 2, 7);
fx = x.* log(x);
plot(x, fx);