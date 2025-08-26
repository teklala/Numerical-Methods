function [root, error, fx, iter] = bisectTekla(func, start, finish, desEr,maxits, varargin )
if nargin<4
    desEr = 0.0001;
end
if nargin <5
    maxits = 100;
end

iter = 0;
rold = start;
er = 100;
while(1)
    rt = (start + finish)/2;
    if rt~=0
        er = abs((rt - rold)*100/rt);
    end
    if er<=desEr
        break;
    end
    test = func(start, varargin{:}) * func(rt, varargin{:});
    if sign(test)>0
        start = rt;
    elseif sign(test)<0
        finish = rt;
    else 
        er = 0;
    end
    iter = iter+1;
    rold = rt;
    
    
    if iter + 1 > maxits
        brea;
    end
    
    
end
root = rt;
error = er;
fx = func(rt, varargin{:});



end

