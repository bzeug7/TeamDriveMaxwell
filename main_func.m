function [] = main_func(filename)
    % placeholder variables    
    theta = 0;
    rmin = 0;
    rmax = 1000;
    zmax = 1000;
    numpoles = 8;
    rpms = 2300;
    % import data from file
    DATA = importdata(filename,',',1);
    % select the points we need
    [x, y, z, vx, vy, vz] = selectPoints(DATA(1),Data(2),DATA(3),DATA(4),DATA(5),DATA(6),1,2,5);
    % next steps:
    % magdir
    magVal = magDir(x,y,z,vx,vy,vz);
    % calc_flux
    [flux, Theta] = calc_flux(theta,rmin,rmax,zmax,magVal);
    % nonlinreg
    [a b c d] = nonlinreg(flux) % subject to change
    % flux_vals
    [A omega emf V] = flux_vals(flux, numpoles, Theta, rpms)
    % do something with this
end