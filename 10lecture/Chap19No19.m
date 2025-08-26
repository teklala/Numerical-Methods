x=[ 0 1 2.8 3.9 3.8 3.2 1.3];
deg=[ 0 30 60 90 120 150 180];
c = cosd(deg);
W =trapz(c, x);
display(W);
plot(deg, W);