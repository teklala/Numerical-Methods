t = 0:0.0001 : 0.020 ;
r = 50;
vt= 3500*sin( 140*pi*t).*exp(-63*pi*t);
f = vt.^2 / r;
tr = cumtrapz(vt, t);

vfunc = @(t) (vt).^2 / r;
result = integral(vfunc, 0, 0.020, 'ArrayValued', true);

plot(t, result)
