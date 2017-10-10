# Team Drive Maxwell code

## Directory Setup
In order to properly run this script, a specific directory structure *must* be set up. In the folder containing the matlab code, there must also be:
1. A folder named 'Input'
2. A folder named 'Output'
3. A folder named 'Images'

**Without this folder setup, the matlab code will NOT run!**

## Running the Script
This script accepts 3 input paremeters:
1. The name of the file to be run, e.g. 'exp1_4pole_nohead.fld'
2. The number of poles in the simulated alternator
3. The desired resolution (in radians) of the flux as a function of theta

This script outputs 5 images, which are placed in the 'Images' directory:
1. An image showing a 2D representation of the points being used in calculations
2. An image showing a 3D representation of the points being used in calculations
3. An image showing the flux output as a function of Cartesian coordinates (scatter)
4. An image showing the flux output as a function of theta (scatter)
5. An image showing the flux output as a function of theta (line)

The script also outputs 4 data types in a .csv file located in the 'Output' directory:
1. Voltage (in Volts)
2. Omega (units?)
3. Current (in Amps)
4. Power (in Watts)

The script will also return to the matlab environment:
1. Voltage (in Volts)
2. Omega (units?)
3. Current (in Amps)

## Troubleshooting
When running the script, examine the 'selectPoints2D' image. If the axes are aligned properly, the image should show a uniform circle/ellipse of points. If this is not the case, it is likely that the axes of the simulation do not line up with what the script is using. To fix this, find this line in `main_func.m`:
```matlab
[x, y, z, vx, vy, vz] = selectPoints(DATA{1},DATA{2},DATA{3},DATA{4},DATA{5},DATA{6},rmin,rmax,zmax);
```
The order of `DATA` entries must be changed until it the proper output is applied (typically rows 2 and 3, paired with 5 and 6, must be swapped), for example:

```matlab
[x, y, z, vx, vy, vz] = selectPoints(DATA{1},DATA{3},DATA{2},DATA{4},DATA{6},DATA{5},rmin,rmax,zmax);
```

**IMPORTANT: Whichever entries of DATA{1}, DATA{2}, and DATA{3} are swapped, the corresponding entries of DATA{4}, DATA{5}, DATA{6} must ALSO be swapped.**
