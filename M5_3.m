%y = ? _4_8w_E_ _I (2x4 ? 3Lx3 + L3x)
%Develop a MATLAB script that
%(a) plots the function, dy/dx versus x (with appropriate labels) and
%uses LastNameBisect to determine the point of maximum
%deflection (i.e., the value of x where dy/dx = 0).
%Then substitute this value into the deflection equation to
%determine the value of the maximum deflection. Employ
%initial guesses of xl = 0 and xu = 0.9L. Use the following
%parameter values in your computation (making sure
%that you use consistent units): L = 400 cm, E = 52,000
%kN/cm2, I = 32,000 cm4, and w = 4 kN/cm. In addition,
%use Ead = 0.0000001 m. Also, set format long in
%your script so you display 15 significant digits for your results.
L = 400; % cm
E = 52000; % kN/cm^2
I = 32000; % cm^4
w = 4; % kN/cm
xl = 0;
xu = 0.9 * L;
Ead = 1e-5;
x=0:1:xu;
f = @(x) (-w / (48 * E * I)) * (8* x.^3 - 9*L*x.^2 + L^3);

plot(x,f(x));
[root, fx, ea, iter] = bisect(f, xl, xu, Ead);
F =  @(x) (-w / (48 * E * I)) * (2* x.^4 - 3*L*x.^3 + x* L^3);
max = (-w / (48 * E * I)) * (2* root^4 - 3*L*root^3 + root* L^3);
