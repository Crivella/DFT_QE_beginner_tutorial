# Convergence over the kinetic cutoff
Once we have determined the minumal cellsize that gives us an insolated molecule we need to calculate the cutoff over the amount of plane waves.
If we wanted to, it could be appropriate to rerun the previous exercise using the ecut determined.
(Usually we solve the 1st problem with a very low ecut to get an extimate of cellsize which we use for ecut. In the end we repeat the 1st step to obtain the best cellsize and bond-enght given the used pseudopotential)

# Purpose
  1. Calculate the kinetic cutoff after having determined the cellsize
  2. Run a calculation for a 0D system

## Running the exercise
  1. Use the provided script 'run_ecut' to run several relax calculation for different cutoff values
      ```
      ./run_ecut
      ```
  2. The script will automatically collect the final coordinates of each calculation and write the in a two-column file vs the ecut
