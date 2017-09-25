function [A omega V] = main_func(filename, numpoles, dtheta)


    % known variables    
    rmin = 0.0482;  %m
    rmax = 0.05875;   %m
    zmax = 0.026725;  %m
   
    
    
    % import data from file
    fileID=fopen(filename);
    DATA = textscan(fileID,'%f %f %f %f %f %f %*[^\n]','Delimiter',' ', 'MultipleDelimsAsOne', 1);
    fclose(fileID);
  
    
    [x, y, z, vx, vy, vz] = selectPoints(DATA{1},DATA{3},DATA{2},DATA{4},DATA{6},DATA{5},rmin,rmax,zmax);
    % This selects the points we within the stator
    
    figure;
    scatter3(x,y,z,0.005)
    [r, theta, z]=toCylind(x,y,z); 
    %Converts to cylindrical coordinates
    
    magVal = magDir(x,y,z,vx,vy,vz);
    % Finds the magnitude of B field vectors pointing away from the center,
    % this will be normal to the stator coils
    
    
    [flux, Theta] = calc_flux(theta,rmin,rmax,zmax,magVal, dtheta);
    % Divides stator into segments base on angle and calculates the flux in
    % each segment, this will make flux a function of theta.  
    
    
    
    for i = 1:23
       rpms = 100*i;
       [A C]=nonlinreg(flux, numpoles, Theta, rpms)
      [A(i) omega(i) emf V(i)] = flux_vals(flux, numpoles, Theta, rpms);  
    end
    
    %For each angular velocity we rewrite flux as a function of time.
    %We then fit it to the equation Flux=(A)sin((omega)t+(phase shift)),
    %and determine the amplitude, voltage and frequency based on the fitted
    %equation    
    
    pause;
    close all;
    
    A = A(:);
    omega = omega(:);
    V = V(:);
    
    %filenameNoSuffix = strsplit(filename, '.');
    %fileOutput = strcat(filenameNoSuffix, '_out.csv');
    %fileOutputChar = char(fileOutput);
    %fileId = fopen(fileOutputChar, 'w');
    %fprintf(fileId, '%6s,%6s,%6s','V','A','omega');
    %fprintf(fildId, '%1.6e,%1.6e,%1.6e', V, A, omega);
end
