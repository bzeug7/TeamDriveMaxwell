function [A omega V] = main_func(filename, numpoles, dtheta)
%% To run this program
% command: [A omega V] = main_func('exp1_4pole_9.fld', 4, .05)
% must ensure that fld file only contains field data, no headers

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
    filenameNoSuffix = strsplit(filename, '.');
    name = char(filenameNoSuffix(1));
    
    selectPoints2DName = strcat(name, '_selectPoints2D');
    title('Selected Points')
    xlabel('x(meters)')
    ylabel('y(meters)')
    print(selectPoints2DName,'-dpng')
    
    figure;
    scatter3(x,y,z,0.005)
    title('Selected Points')
    xlabel('x(meters)')
    ylabel('y(meters)')
    zlabel('z(meters)')
    selectPoints3DName = strcat(name, '_selectPoints3D');
    print(selectPoints3DName,'-dpng')
    
    [r, theta, z]=toCylind(x,y,z); 
    %Converts to cylindrical coordinates
    
    magVal = magDir(x,y,z,vx,vy,vz);
    % Finds the magnitude of B field vectors pointing away from the center,
    % this will be normal to the stator coils
    
    
    [flux, Theta] = calc_flux(theta,rmin,rmax,zmax,magVal, dtheta);
    % Divides stator into segments base on angle and calculates the flux in
    % each segment, this will make flux a function of theta.  
    figure;
    rout = ones(size(Theta));
    [x y] = pol2cart(Theta, rout);
    scatter3(x, y, flux, 15, 'filled');
    title('Flux Output')
    xlabel('x(meters)')
    ylabel('y(meters)')
    zlabel('flux')
    
    fluxCartesianName = strcat(name, '_fluxCartesian');
    print(fluxCartesianName, '-dpng');
    
    figure;
    scatter(Theta, flux, 15, 'filled');
    title('Flux vs. Theta')
    xlabel('theta')
    ylabel('flux')
    
    fluxThetaName = strcat(name, '_fluxTheta');
    print(fluxThetaName, '-dpng');
    
    figure;
    plot(Theta, flux);
    title('Flux vs. Theta')
    xlabel('theta')
    ylabel('flux')
    
    fluxThetaLineName = strcat(name, '_fluxThetaLine');
    print(fluxThetaLineName, '-dpng');
    
    for i = 1:23
       rpms = 100*i;
       %[A C]=nonlinreg(flux, numpoles, Theta, rpms)
      [A(i) omega(i) emf V(i)] = flux_vals(flux, numpoles, Theta, rpms);  
    end
    
    %For each angular velocity we rewrite flux as a function of time.
    %We then fit it to the equation Flux=(A)sin((omega)t+(phase shift)),
    %and determine the amplitude, voltage and frequency based on the fitted
    %equation    
    
    pause;
    close all;
    Power = A .* V;
    output = [V; A; omega; Power];
    A = A(:);
    omega = omega(:);
    V = V(:);
    
    
    
    fileOutput = strcat(name, '_out.csv');
    fileId = fopen(fileOutput, 'w');
    fprintf(fileId, '%6s\n', name);
    fprintf(fileId, '%6s,%12s,%12s,%12s\n','V','A','omega','Power');
    fprintf(fileId, '%1.6e,%1.6e,%1.6e,%1.6e\n', output);

end
