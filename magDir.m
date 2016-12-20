function [magVal] = magDir(x, y, z, vectX, vectY, vectZ)

    dot = x*vectX + y.*vectY + z.*vectZ
    pointMag = mag(x,y,z)
    magVal = dot./pointMag
    
end