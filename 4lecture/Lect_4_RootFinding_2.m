%% Lect 4 - Root Finding 2: Open methods - Newton, Secant

%% iterative methods
numIter=10; %number of  iterations
x=zeros(1,numIter+1); % initialize x vector (keeps successive values)
x(1)=0;
error = zeros(1,numIter);
for  i=1:1:numIter
   x(i+1)= exp(-x(i));
   error(i)=abs((x(i+1)-x(i))/x(i+1))*100;
end

x
error
%%
ea=1
i=1;
x(1)=0.5;
while ea > 0.01
    x(i+1)=sin(sqrt(x(i)));
    ea= abs((x(i+1)-x(i))/x(i+1))*100;
    i=i+1;
end
x

%%
trueVal = 0.56714329;
errorTrue=abs((trueVal-x)/trueVal)*100
plot(errorTrue)

%% Newton's Method
f=@(x) x^2 - 2
df=@(x) 2*x

[root, ea,  iter] = newtraph(f,df,1,0.5)

%% MATLAB BUILT IN Root Finding Methods
% r=roots(p); %finds all complex roots of a  polynomial
% x=fzero(fun,x0); %finds one root of a non-liner function 

%% x^3-3x^2+4x-2=0
p=[1 -3 4 -2];
r=roots(p)

%% root of non-linear fucntion 
% x=e^(-ax), a=0.5
% x=fzero(@(x)f(x,c1,...),x0)
f=@(x,a) x-exp(-a*x); %solving for zero

a=1/2;
x0=0; % initial  guess (in general do not use zeros)
r=fzero(@(x) f(x,a),x0)
