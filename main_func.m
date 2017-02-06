function [A omega V] = main_func(filename)
    % placeholder variables    
    theta = 0;
    rmin = 96.86 ; %mm
    rmax = 116.2;
    zmax = 26.725;
    numpoles = 8;
    rpms = 2300;
    % import data from file
    fileID=fopen(filename);
    DATA = textscan(fileID,'%f %f %f %f %f %f','Delimiter',',');
    fclose(fileID);
    % select the points we need, if the bounds are set correctly we should
    % never get NaN in our final vectors
    
    [x, y, z, vx, vy, vz] = selectPoints(DATA{1},DATA{2},DATA{3},DATA{4},DATA{5},DATA{6},rmin,rmax,zmax);
    % next steps:
    %Convert to cylindrical coordinates
    [r, theta, z]=toCylind(x,y,z); 
    % magdir
    magVal = magDir(x,y,z,vx,vy,vz);
    % calc_flux
    [flux, Theta] = calc_flux(theta,rmin,rmax,zmax,magVal);
    % nonlinreg
    %[a b c d] = nonlinreg(flux) % hopefully will replace flux_vals
    %someday, better, quantifies error, but really difficult 
    % flux_vals
    for i = 1:23
        rpms = 100*i;
      [A(i) omega(i) emf V(i)] = flux_vals(flux, numpoles, Theta, rpms);  
    end
    
    
    % do something with this
end