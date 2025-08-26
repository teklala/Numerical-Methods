H = 30;
n = 6;
f = @(z)  200 * (z./ (5+ z )).* exp(-2*z./H);
I = compSimp(f, 0, H, n);
display(I);

f2 = @(z)  200 * (z./ (5+ z )).* exp(-2*z./H).*z;
I2 = compSimp(f2, 0, H, n);
display(I2);