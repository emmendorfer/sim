This project contains the R source code of the Self-Interpolation Method (SIM).

This algorithm builds a Digital Terrain Model (DTM) from a Digital Surface Model (DSM) given as input.
The "raster" R package is required.

# Input :
# - dsm : dsm to be filtered (in raster R format)
# Parameters :
# - d : window size 
# - k : number of iterations to be performed
#  Output :
#  - filtered dtm 

The method is described and evaluated in the paper:
L.R. Emmendorfer, I.B. Emmendorfer, L.P.M. de Almeida, D.C.L. Alves and J.A. Neto. A Self-Interpolation Method for Digital Terrain Model Generation (submitted), 2021.

