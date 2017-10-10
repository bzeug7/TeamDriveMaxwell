# Team Drive Maxwell code

## Directory Setup
In order to properly run this script, a specific directory structure *must* be set up. In the folder containing the matlab code, there must also be:
1. A folder named 'Input'
2. A folder named 'Output'
3. A folder named 'Images'

**Without this folder setup, the matlab code will NOT run!**

## Running the Script
This script accepts 3 input paremeters:
1. The name of the file to be run
  * e.g. 'exp1_4pole_nohead.fld'
2. The number of poles in the simulated alternator
3. The desired resolution (in radians) of the flux as a function of theta

This script outputs 5 images, which are placed in the 'Images' directory:
1. An image showing a 2D representation of the points being used in calculations
2. An image showing a 3D representation of the points being used in calculations
3. An image showing the flux output as a function of Cartesian coordinates (scatter)
4. An image showing the flux output as a function of theta (scatter)
5. An image showing the flux output as a function of theta (line)

