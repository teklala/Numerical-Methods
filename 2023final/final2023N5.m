

g = 10;
r = 1;

t = 0:0.1:15;
tet = cos((g^(1/2)*t)/r^(1/2)) * pi/18;

figure
plot(t, tet, 'y');
hold on
y0 = [pi/18 , 0];
tspan = [0 15];
h = 0.01;
[tp,tetp] = rk4sys(@dydt,tspan,y0,h, g, r);
plot(tp, tetp(:,1), 'r');
hold on
[tp2,tetp2] = rk4sys(@dydt2,tspan,y0,h, g, r);
plot(tp2, tetp2(:,1), 'b');




%% meore nawili
g = 10;
r = 1;

t = 0:0.1:15;
tet = cos((g^(1/2)*t)/r^(1/2)) * pi/18 + r^(1/2)*sin((g^(1/2)*t)/r^(1/2))/g^(1/2) * pi/18 ;
figure
plot(t, tet, 'y');
hold on
y0 = [pi/18 , pi/18];
tspan = [0 15];
h = 0.01;
[tp,tetp] = rk4sys(@dydt,tspan,y0,h, g, r);
plot(tp, tetp(:,1), 'r');
hold on
[tp2,tetp2] = rk4sys(@dydt2,tspan,y0,h, g, r);
plot(tp2, tetp2(:,1), 'b');


%% mesame nawili


g = 10;
r = 1;

t = 0:0.01:15;


%plot(t, tet, 'y');
hold on
y0 = [pi/4 , 0];
tspan = [0 15];
h = 0.01;
[tp,tetp] = rk4sys(@dydt,tspan,y0,h, g, r);
%plot(tp, tetp(:,1), 'r');
hold on
[tp2,tetp2] = rk4sys(@dydt2,tspan,y0,h, g, r);
%plot(tp2, tetp2(:,1), 'b');


tet = cos((g^(1/2)*t)/r^(1/2)) * pi/4;
plot(t, tetp2(:,1) - tetp(:,1));

plot(t, tetp2(:,1) - tet');



%% meotxe
g = 10;
r = 1;

t = 0:0.01:15;
tet = cos((g^(1/2)*t)/r^(1/2)) * pi/6;

figure
plot(t, tet, 'y');
hold on
y0 = [pi/6 , 0];
tspan = [0 15];
h = 0.01;
[tp,tetp] = rk4sys(@dydt,tspan,y0,h, g, r);
plot(tp, tetp(:,1), 'r');
hold on
[tp2,tetp2] = rk4sys(@dydt2,tspan,y0,h, g, r);
plot(tp2, tetp2(:,1), 'b');

figure
plot(t, tetp2(:,1) - tetp(:,1));
figure
plot(t, tetp2(:,1) - tet);


%% mexute nawili
g = 10;
r = 1;

figure
y0 = [pi/4 , 600/360 * pi];
tspan = [0 15];
h = 0.01;
[tp3,tetp3] = rk4sys(@dydt3,tspan,y0,h, g, r);
plot(tp3, tetp3(:,1), 'b');









function yp = dydt(t, y, g, r)
    yp = [y(2); (y(1) - 1/6 * y(1)^3) * (-g/r)];

end



function yp = dydt2(t, y, g, r)
    yp = [y(2); sin(y(1)) * (-g/r)];

end



function yp = dydt3(t, y, g, r)
    yp = [y(2); sin(y(1)) * (-g/r) - 0.1 * y(2)];

end