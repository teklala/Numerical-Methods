%% Numerical Methods - Lect 1 
%% Analytical Solution
t_a =0:0.1:12;
v_analytical = sqrt(9.81*68.1/0.25).*tanh(sqrt(9.81*0.25/68.1).*t_a);

plot(t_a,v_analytical,'b')
grid on
hold on
ylabel('velocity (m/s)')
xlabel('time (sec)')
%% Numerical Solution (Euler's Method)

t_n=0:2:12;
v(1)=0;

for i=2:1:7
    
    v(i)=v(i-1)+(9.81-(0.25/68.1)*(v(i-1))^2)*2
    plot(t_n(i),v(i),'kx','linewidth',2)
end

plot(t_n,v,'-r')


%% Numerical Solution (Euler's Method)
h=2;
t_n=0:h:12;
v(1)=0;

n=12/h;
for i=2:1:(n+1)
    
    v(i)=v(i-1)+(9.81-(0.25/68.1)*(v(i-1))^2)*h
    plot(t_n(i),v(i),'kx','linewidth',2)
end

plot(t_n,v,'-r')
hold on