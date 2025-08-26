%% NM Lect 6 - Polynomial Interpolation

format long
A =[301^2 301 1; 400^2 400 1; 500^2 500 1];
b=[0.616 0.525 0.457]';
p=inv(A)*b

% This method is very sensitive to roundoff error

%% condition number determines the level of "invertability" of a matrix
% cond(A)
B=[1 2; 1 1]
cond(B)

B=[1 2; 1 1.9];
cond(B)

B=[1 2; 1 1.99999]; % ill-conditioned
cond(B)
inv(B)

%% BUILT-IN POLYNOMIAL FITING FUNCTION
format long
x=[300 400 500];
f=[0.616 0.525 0.457];
p=polyfit(x,f,2)

% to interpolate (evalueate p at some other point we use)
d=polyval(p,350)

%% Newton Interpolation

x=[1,4,6,5]';
y=log(x);
f=Newtint(x,y,2)

%% Lagrange Interpolation
x=[1,4,6,5]';
y=log(x);
Lagrange(x,y,2)

