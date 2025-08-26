f = @(x, y, z)x.^2 + 3*y - z;

I = int3DNew(f, 0, 2, 1, 4, -1, 1);
I2 = integral3(f,0, 2, 1, 4, -1, 1 );
display(I);
display(I2);
