%function [X Y Z VX VY VZ] = selectPoints(x, y, z, vx, vy, vz, r1, r2, xmin, xmax)
xmax=.015;
j=1;
r1=.010;
r2=.012;
for i = 1:length(x)
    if(y(i)^2 + z(i)^2)^0.5 > r1  %finds points between r1 and r2
        X1(j) = x(i);
        Y1(j) = y(i);
        Z1(j) = z(i);
        Vx1(j)=vx(i);
        Vy1(j)=vy(i);
        Vz1(j)=vz(i);
        j=j+1;
    end
end
j;
i;
X1(10);
length(X1);
for i=1:length(X1)
    if (y(i)^2 + z(i)^2)^0.5 < r2
        
        X2(j) = X1(i);
        Y2(j) = Y1(i);
        Z2(j) = Z1(i);
        Vx2(j)=Vx1(i);
        Vy2(j)=Vy1(i);
        Vz2(j)=Vz1(i);
        j=j+1;
    end
end

for i=1:length(X2)
    if abs(X2(i))<xmax %finds points in our x range
         X(j) = X2(i);
        Y(j) = Y2(i);
        Z(j) = Z2(i);
        Vx(j)=Vx2(i);
        Vy(j)=Vy2(i);
        Vz(j)=Vz2(i);
        j=j+1;
    end
end

for i=length(X)
    %magVal = magDir(0, Y(i), Z(i), Vx(i), Vy(i), Vz(i)); %Finds magnitude in direction away from X axis (not from center
   
    dot(i) = 0*X(i)+ Y(i)*Vy(i) + Z(i)*Vz(i);
    pointMag(i) = mag(X(i),Y(i),Z(i));
    magVal(i) = dot(i)/pointMag(i);
end

%switches to cylindrical coordinates coordinates

for i=length(X)
    theta(i)=atan(Z/Y)
    %X is left alone
    R(i)=sqrt(X(i)^2+Z(i)^2)
end

dtheta=.1
Theta=0:dtheta:2*pi;

k=1; 
for j=1:length(Theta)
    for i=1:length(theta)
    
        if theta(i)>=Theta(j), theta(i)<Theata(j+1)
            angle
            Angle(k)=theta(i);
            Radius(k)=r(k)
            X2(k)=X(i)
            k+1;
        end
    end
    for k=1:length(Angle)
        magfield=sum(Angle(k));
    end
    vol=(r2-r1)*dtheta/(2*pi)*(2*pi*r1)*2*xmax;
    flux(j)=magfield/vol;
   
end

figure
plot(Theta,flux)
title('Flux as a function of angle')
xlabel('Angle (radians)')
ylabel('Flux (Estimate)')

omega=166; %rad/s

t=Theta./omega;

figure
plot(t,flux)
title('Flux as a function of time')
xlabel('time (seconds)')
ylabel('Flux (Estimate)')


    


%end