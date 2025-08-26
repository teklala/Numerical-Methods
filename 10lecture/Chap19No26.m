t=[0 4 8 12 16 20 24 28 30];
v=[ 0 18 31 42 50 56 61 65 70];
S = trapz(t, v);
display(S);
avg = S/30;
display(avg);
