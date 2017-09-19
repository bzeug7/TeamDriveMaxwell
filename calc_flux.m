function [flux, Theta] = calc_flux(theta, rmin, rmax, zmax, magB, dtheta)

%The first part of this function divides the cylindrical shell that
%represents the stator into segments (or really slices) based on angle.
Theta=0:dtheta:2*pi;
flux = zeros(size(Theta));
r = ones(size(Theta));
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
    %vol=(rmax^2-rmin^2).*dtheta.*zmax;  %This is the volume of each segment
    area = 2*rmin*dtheta*zmax;
    flux(j)=magfield*area;
    %Flux is determined to taking the sum of the magnitudes of the vectors
    %normal to the stator in each segment and dividing it by the volume of the segment.
    
    %why do we divide by volume? Wikipedia:  Thus, the SI base units of electric flux are kg·m3·s?3·A?1
end
figure;
[x y] = pol2cart(Theta, r);
scatter3(x, y, flux);
figure;
scatter(Theta, flux);
