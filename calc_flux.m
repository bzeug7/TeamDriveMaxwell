function [flux, Theta] = calc_flux(theta, rmin, rmax, zmax, magB)
dtheta=.1
Theta=0:dtheta:2*pi;
magfield = 0;
k=1; 
for j=1:length(Theta)
    magfield = 0;
    for i=1:length(theta)
        k = 1;
        if theta(i)>=Theta(j), theta(i)<Theta(j+1)
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
    vol=(rmax^2-rmin^2)*dtheta*xmax; % maybe
    flux(j)=magfield/vol;
   
end