function [root, ea, numIts] = newTraTekla(func,dfunc,guess, de, maxit, varargin)
if nargin<4
    de = 0.0001;
end

if nargin<5
    maxit = 50;
end
e = 100;
it = 0;
xold = guess;
while(1)
    if (e<de || e==de)
        break;
    end
    
    if it>= maxit
        break;
    end
    
    fx = func(xold);
    dfx = dfunc(xold);
    xnew = xold - fx/dfx;
    if e~=0
        e = abs((xnew - xold)*100/xnew) ;
    end
    it = it+1;
    xold = xnew;
end
root = xnew;
ea = e;
numIts = it;

end

