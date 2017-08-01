function [A omega emf V] = flux_vals(flux,poles, radians, ang_vel)
    A = (max(flux) - min(flux))/2;
    t = radians./ang_vel;
    period = (t(end) - t(1))/poles;
    omega = 1/period;
    emf = -A*omega*cos(omega.*t);
    Vphase = 5*(max(emf) - min(emf))/2; %5 turns per stator
    Vm=sqrt(3).*Vphase;
    Vrms=1.6554.*Vm; %based on 3 phase rms derivation
    V=Vrms;
    
end