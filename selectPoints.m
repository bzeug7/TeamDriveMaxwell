function [X Y Z Vx Vy Vz] = selectPoints(x, y, z, vx, vy, vz, r1, r2, xmax)
j=1;
%for i = 1:length(x)
%    if((y(i)^2 + z(i)^2)^0.5 > r1 &&  (y(i)^2 + z(i)^2)^0.5 < r2)
 %       
  %      if(x(i) > xmin && x(i) < xmax)
   %     X[j] = x[j];
    %   Y[j] = y[i];
     %   VY[j] = vy[j];
      %  Z[j] = z[i];
       % VZ[j] = vz[j];
        %end
   % end
    %j = j + 1;
%end
%end

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
j = 1;
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
j = 1;
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