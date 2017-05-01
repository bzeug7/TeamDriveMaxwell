function [X Y Z Vx Vy Vz] = selectPoints(x, y, z, vx, vy, vz, r1, r2, xmax)
%this function selects all of the vectors within the B field, within the stator. 
%The stator is assumed to take the shape of a cylindrical shell with an inner and outer radius.  

j=1;

%This selects all of the points that are outside of the inner radius of the
%shell
figure;
scatter(x,y)
X1 = [];
for i = 1:length(x)
    if(x(i)^2 + y(i)^2)^0.5 > r1  %finds points between r1 and r2
        X1(j) = x(i);
        Y1(j) = y(i);
        Z1(j) = z(i);
        Vx1(j)=vx(i);
        Vy1(j)=vy(i);
        Vz1(j)=vz(i);
        j=j+1;
    end
end


%This selects all of the points that are within the outer radius of the
%shell, the remaining points are now between the inner and outer radii
j = 1;
figure;
scatter(X1, Y1)
X2 = [];
for i=1:length(X1)
    if (X1(i)^2 + Y1(i)^2)^0.5 < r2
        
        X2(j) = X1(i);
        Y2(j) = Y1(i);
        Z2(j) = Z1(i);
        Vx2(j)=Vx1(i);
        Vy2(j)=Vy1(i);
        Vz2(j)=Vz1(i);
        j=j+1;
    end
end
j = 1;

X = [];
Y = [];
Z = [];
Vx = [];
Vy = [];
Vz = [];

%finds points within our x range and removes any NaN values we may have
%within these points
figure;
scatter(X2,Y2)
for i=1:length(X2)
    if abs(Z2(i))<xmax && ~isnan(Vx2(i)) 
         X(j) = X2(i);
        Y(j) = Y2(i);
        Z(j) = Z2(i);
        Vx(j)=Vx2(i);
        Vy(j)=Vy2(i);
        Vz(j)=Vz2(i);
        j=j+1;
    end
    
    %By this points all of the remaining points are within the cylindrical
    %shell that represents the stators
end
