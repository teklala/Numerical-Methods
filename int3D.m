function [I] =int3D(f, xl, xu, yl, yu, zl, zu)

h1 = abs(xl - xu);
h2 = abs(yl - yu);
h3 = abs(zl - zu);
m = min([h1, h2, h3]);
ix = 0;
iy = 0;
iz = 0;

if(m==h1)
    ix = 100;
    iy = 100* h2/h1;
    iz = 100 * h3/h1;
    
elseif (m==h2)
    iy = 100;
    ix = 100* h1/h2;
    iz = 100 * h3/h2;
    
elseif (m==h3)
    iz = 100;
    iy = 100* h2/h3;
    ix = 100 * h1/h3;
end

x = linspace(xl, xu, ix);
y = linspace(yl, yu, iy);
z = linspace(zl, zu, iz);


i1 = [];
for j = 1:length(y)
    for k = 1:length(z)
        i1(j,k) = trapTekla(@(x)f(x,y(j), z(k) ),xl, xu, ix);
    end
end


i2 = [];
for k = 1:length(z)
    i2(k) = trapz(y, i1(:,k));
end


i3 = trapz(z, i2);
I = i3;
end

