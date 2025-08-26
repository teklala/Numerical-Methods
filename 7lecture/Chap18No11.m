x = linspace(-1,1,5);
xx = -1:0.1:1;
y = 1./ (1 + 25*x.^2);
plot(x, y, 'ro');
hold on

%fourth order polynomial
p = polyfit(x, y, 4);
v = polyval(p, xx);
plot(xx, v, 'b-');

%linear spline
yn = interp1(x, y, xx,'linear' );
plot(xx, yn, 'g-');

%cubic spline
ycubic = spline(x, y, xx);
plot(xx, ycubic, 'm--');