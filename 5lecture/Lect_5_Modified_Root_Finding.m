%% NM Lect 5

% fzero(function,x0) -> initial guess x0
% fzero(function, [x0 x1]) -> two guesses x0,x1 bracket the root


%% Brendt
x=linspace(0,5,300);
y=@(x) x.^3-2*x.^2-sin(x);
figure()
plot(x,y(x))
root=brendt(y,0,3)

%% Solve x^2-9

fun = @(x) x^2-9;
x0 = 0.2;
z=fzero(fun,x0)
%%
% If we want positive root we guess close to it
x0=0.6;
z=fzero(fun,x0)
%%
%If a sign change soes not happen between guesses it gives an error
x=fzero(fun,[-4,4])

%% x^10-1
options=optimset('display','iter');
fun= @(x) x.^10-1;
x=linspace(-1,5,200);
plot(x,fun(x))
[x,fx]=fzero(fun,0.5,options)

%% less stringent tolerance:
options=optimset('display','iter','tolx',1e-33);
fun= @(x) x^10-1;
[x,fx]=fzero(fun,0.5,options)

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% POLYNOMIAL ROOTS

c= [1 -3.5 2.75 2.125 -3.875 1.25];

% to evaluare the polynomial at some point:
polyval(c,1)
%%
% Determine roots
x=roots(c)
%%
%to go back to polynomial 
c1=poly(x)
%%%%%%%%%%%%%%%%%%%%%%%
