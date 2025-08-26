function [roots,numRoots] = impIncr(func,start, finish, numInts)
if nargin<4 
    numInts = 50;
end

args = linspace(start, finish, numInts);
roots = [];
f=  func(args);
numRoots = 0;
for i = 1:1:length(args) - 1
    
    if sign(f(i) ) ~= sign( f(i+1) )  
        numRoots = numRoots +1;
        roots(numRoots, 1) = args(i);
        roots(numRoots, 2) = args(i+1);
      
    end
end
end

