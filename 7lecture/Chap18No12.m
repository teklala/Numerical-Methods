t = linspace(0, 2*pi, 8);
f = sin(t).^2;
tn = 0:0.1:2*pi;
plot(t, f, 'ro');
hold on


%not a knot
y1 = spline(t, f, tn);
plot(tn, y1, 'b-');

%clamped
fn = [0 f 0];
y2 = spline(t, fn, tn);
plot(tn, y2, 'g-');

