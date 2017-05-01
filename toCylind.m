function [R theta Z] = toCylind(x, y, z)
   %Converts cartesian coordinates that give the position of each B vector
   %into polar coordinates. 
quadrants = zeros(size(x));
for i = 1:length(x)
    if x(i)>=0 && y(i)>=0
        %quadrant 1
        quadrants(i) = 0;
    elseif x(i)<=0 && y(i)>=0
        %quadrant 2
        quadrants(i) = pi;
    elseif x(i)<=0 && y(i)<=0
        %quadrant 3
        quadrants(i) = pi;
    elseif x(i)>=0 && y(i)<=0
        %quadrant 4
        quadrants(i) = 2*pi;
    end
end
theta=atan(x./y);
theta = theta + quadrants;
    %X is left alone
    R= sqrt(x.^2+y.^2);
    Z = z;
