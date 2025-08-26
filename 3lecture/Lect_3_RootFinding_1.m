%% Lect 3 - Graphical and Bisection Methods
%% Graphical Method
cd = 0.25; g = 9.81; v = 36; t = 4;
mp = linspace(50,200);
fp = sqrt(g*mp/cd).*tanh(sqrt(g*cd./mp)*t)-v;
plot(mp,fp),grid

%%
m=142.8;
sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t)-v

%% Incremental Search
f=@(x) sin(10*x)+cos(3*x);
%brackets = incsearch(f,3,6); % misses one root
brackets=incsearch(f,3,6,100);
figure()
x=3:0.01:6;
plot(x,f(x),'Linewidth',1)
grid on
hold  on
for  i=1:size(brackets,1)
    plot(brackets(i,1),0,'rx')
    plot(brackets(i,2),0,'rx')
end

%% Bisection Method

t=4;
v=36;
fm =@(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*t) - v;
[mass fx ea iter] = bisect(fm,40,200) 

