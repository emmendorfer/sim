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
L.R. Emmendorfer, I.B. Emmendorfer, L.P.M. de Almeida, D.C.L. Alves and J.A. Neto (2021) A Self-interpolation Method for Digital Terrain Model Generation. In: Gervasi O. et al. (eds) Computational Science and Its Applications – ICCSA 2021. ICCSA 2021. Lecture Notes in Computer Science, vol 12949. Springer, Cham. https://doi.org/10.1007/978-3-030-86653-2_26
