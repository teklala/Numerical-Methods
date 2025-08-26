
%t = -1:0.0001:10;
T = @(t)100* (1- exp(-0.2*t)) - 40 * exp(-0.01*t);
%plot(t, T);

[root,fx,ea,iter]=bisect(T,2,3,10^-6);
display(root);