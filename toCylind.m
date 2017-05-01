function [R theta Z] = toCylind(x, y, z)
   %Converts cartesian coordinates that give the position of each B vector
   %into polar coordinates. 

theta=atan(x./y);
    %X is left alone
    R= sqrt(x.^2+y.^2);
    Z = z;
