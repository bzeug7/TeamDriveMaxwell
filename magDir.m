function [magVal] = magDir(x, y, z, vectX, vectY, vectZ)

%Finds the magnitude of each B vector in the direction away from the
%center, this means that it is normal to the stator coils
    dot = x.*vectX + y.*vectY + z.*vectZ;
    pointMag = mag(x,y,z);
    magVal = dot./pointMag;
    
end