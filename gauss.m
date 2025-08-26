function [I] = gauss(func, xl, xu)
    a = xl;
    b = xu;
    a1 = (b + a) / 2;
    a2 = (b - a) / 2;

    x1 = -1 / sqrt(3);
    x2 = 1 / sqrt(3);

    xd1 = a1 + a2 * x1;
    xd2 = a1 + a2 * x2;

    f1 = func(xd1);
    f2 = func(xd2);

    I = a2 * (f1 + f2); 
end

