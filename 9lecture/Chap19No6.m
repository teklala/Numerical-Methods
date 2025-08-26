syms x y
f1 = @(x, y) x^2 - 3*y^2 + x*y^3;


I = @(y) trapTekla(@(x) f1(x, y), 0, 4, 100);


I2 = trapTekla(I, -2, 2, 100);

disp(I2);
