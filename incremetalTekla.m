function [roots,numRoots] = incremetalTekla(func,start, finish, numOfInts)

if nargin <3 
    numOfInts = 20;
end
numRoots = 0;
roots = [];
h = (finish - start)/ numOfInts;
ind = 1;
for i= start:h: finish -h
    left = func(i);
    right =func(i+h);
    if sign( left ) ~= sign(right)
        roots(ind, 1) = i;
        roots(ind, 2) = i+h;
        ind = ind+1;
        numRoots = numRoots +1;
    end
    
end


end

