function [R theta Z] = toCylind(x, y, z)
   %Converts cartesian coordinates that give the position of each B vector
   %into polar coordinates. 

theta=atan(z./y);
    %X is left alone
    R= sqrt(x.^2+z.^2);
    Z = x;