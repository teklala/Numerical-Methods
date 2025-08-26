function out = fibonacciTekla(n)
    if n == 0
        out = 0;
    elseif n == 1 || n == 2
        out = 1;
    else
        
        y1 = 1;
        y2 = 1;
        for i = 3:n
            y = y1 + y2;
            y1 = y2;
            y2 = y;
        end
        
        if n > 0
            out = round(y);
        elseif n<0
            out = (-1)^(abs(n)+1) * round(y);
        end
    end
    
  
end

