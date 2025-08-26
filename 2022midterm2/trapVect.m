function [I] = trapVect(x, y)

if length(x) ~=length(y)
    error('not same length vetors');
end
I =0;
for i=1:length(x)-1
    fa = y(i);
    fb = y(i+1);
    h = abs(x(i) - x(i+1));
    I = I + h* (fa + fb)/2;
end

end

