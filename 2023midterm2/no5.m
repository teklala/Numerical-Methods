f = @(x, y, z) x.^2 .* cos(x.* y.* z); 

I =int3D(f, -2,2,-3,3,0,10);
display(I);
matlabIntegral = integral3(f, -2,2,-3,3,0,10);
display(matlabIntegral);