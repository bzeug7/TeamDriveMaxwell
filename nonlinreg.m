function [a c] = nonlinreg(flux,poles, radians, ang_vel)


tf=2*pi;
t=0:tf/100:tf;


    A = (max(flux) - min(flux))/2;
    t = radians./ang_vel;
    %period = (t(end) - t(1))./poles;
    %omega = 1/period;
b=2*pi()./(poles);
%parameters should be a=25, b=4, c=11,d=-12
x=t;
% Nonlinear regression by minimization of error
Sr=@(a,c) sum((flux-a*sin(b*t+c)).^2);

sol=fminsearch(@(sol) Sr(sol(1),sol(2)),[A 0]);


a=sol(1)
c=sol(2)


nonlinreg=@(x) a*sin(b*x+c);
error=Sr(a,c)



plot(t,flux)
hold on
plot(t,nonlinreg(t),'r--')
hold off