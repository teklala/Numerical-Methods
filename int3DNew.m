function [I] = int3DNew(f, xl, xu, yl, yu, zl, zu)
h1 = abs(xl - xu);
h2 = abs(yl - yu);
h3 = abs(zl - zu);
m = min([h1, h2, h3]);

xi = 100 * h1/m;
yi = 100 * h2/m;
zi = 100* h3/m;

%x = linspace(xl, xu, xi);
%y = linspace(yl, yu, yi);
%z = linspace(zl, zu, zi);

Ix = @(y, z)trapTekla(@(x)f(x, y, z), xl, xu, xi);
Iy = @(z) trapTekla(@(y)Ix(y, z), yl, yu, yi);
I = trapTekla(@(z)Iy(z), zl, zu, zi);
end

