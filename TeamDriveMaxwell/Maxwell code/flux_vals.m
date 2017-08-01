function [A omega emf V] = flux_vals(flux,poles, radians, ang_vel)
figure
plot(radians,flux)    
A = (max(flux) - min(flux))/2;
    t = radians./ang_vel;
    period = (t(end) - t(1))/poles;
    omega = 1/period;
    emf = -A*omega*cos(omega.*t);
    V = (max(emf) - min(emf))/2/sqrt(2);
end