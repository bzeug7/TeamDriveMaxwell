function [R theta Z] = toCylind(x, y, z)
    theta=atan(z./y);
    %X is left alone
    R= sqrt(x.^2+z.^2);
    Z = x;