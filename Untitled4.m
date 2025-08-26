func = @ (x)x.^2 + 3;
I = gauss(@(x)func, 0, 3);
display(I);