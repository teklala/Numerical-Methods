function [I] = simpsonWithATwist(x, y)

if length(x)~=length(y)
    erro('not same length inputs');
end

%check if equaspaced
h =( x(2) - x(1) );
for i=1:1:length(x)-1
    hn = x(i+1) - x(i);
    if hn ~=h
        error('not equaspaced');
    end
    h = hn;
end

if length(x)==2
    I = h * (y(1) + y(2)) /2;
    return;
elseif rem ( length(x) , 2)==0 
    
    n = length(x) - 3;
    a = y(1);
    b = y(n);
    s1 = 4* sum(y(2:2:n-1));
    s2 = 2* sum(y(3:2:n-2));
    I1 = h * (a + s1+s2+ b)/(3*n);
    l = length(x);
    I2 = h * (y(l-3) + 3*y(l-2) + 3*y(l-1) + y(l))/8;
    I = I1 + I2;
    
else
    n = length(x);
    a = y(1);
    b = y(n);
    s1 = 4* sum(y(2:2:n-1));
    s2 = 2* sum(y(3:2:n-2));
    I = h * (a + s1+s2+ b)/(3*n);
    
end


end

