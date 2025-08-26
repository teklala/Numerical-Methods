time=[0 15 30 45 75 105];
rate =[ 18 23 14 24 20 9];
I = trapz(time, rate);
display(I);
perM = I/105;
display(perM);