function [flux, Theta] = calc_flux(theta, rmin, rmax, zmax, magB)

%The first part of this function divides the cylindrical shell that
%represents the stator into segments (or really slices) based on angle.
dtheta=.1;
Theta=0:dtheta:2*pi;

k=1; 
for j=1:length(Theta)-1
    magfield = 0;
    for i=1:length(theta)
        k = 1;
        if theta(i)>=Theta(j) && theta(i)<Theta(j+1);
            magfield = magfield + magB(i);
            %Angle(k)=theta(i);
            %Radius(k)=r(k)
            %X2(k)=X(i)
            %k+1;
        end
    
    end
    %for k=1:length(Angle)
    %    magfield=sum(Angle(k));
    %end
    vol=(rmax^2-rmin^2).*dtheta.*zmax;  %This is the volume of each segment
    flux(j)=magfield/vol;
   
    %Flux is determined to taking the sum of the magnitudes of the vectors
    %normal to the stator in each segment and dividing it by the volume of the segment.
    
    
   
end
