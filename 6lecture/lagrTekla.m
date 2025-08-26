function [res] = lagrTekla(x,y, xx)
sum = 0;
n = length(x);
for i = 1:1:n
    product = y(i);
    for j =1:1:n
        if i~=j
             product = product * (xx - x(j)) / ( x(i) - x(j)) ;
        end 
        
    end
    sum = sum + product;
    
    
end
res = sum;

end

