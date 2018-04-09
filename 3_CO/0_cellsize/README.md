# Convergence over amount of vacuum
Similarly to exercise '1_BN' we are dealing with a system that is not periodic (in this case for all direction).
Hence we need to put vacuum around our molecule in all directions. The amount of vacuum is to be determined through a convergency test.
If we have enough vacuum for the molecules to be non-interacting, we expect quantity such as the bond lenght not to vary if we further increase the vacuum.
The same should apply for the binding energy calculated as the total energy of the isolated atoms minus the total energy of the molucule.
Another difference from exercise '1_BN' is the fact that there we assumed the hexagonal geometry without relaxing the position of the atoms.
There the bond-lenght would vary with the cell dimension.
In this exercise we only know that we have a carbon and an oxygen atom and a starting guess for the distance between the 2.
We could run several calculations for each possible distance and find the minimum by fitting the data with a Lennard-Jones potential, but in this case it is easier to let QE do the work for us, by moving the atoms position according to the forces acting on them ('relax' calculation)

# Purpose
  1. Run a relax calculation
  2. Run a calculation for a 0D system

## Running the exercise
  1. Use the provided script 'run_cellsize' to run several relax calculation for different cellsizes
      ```
      ./run_cellsize
      ```
  2. The script will automatically collect the final coordinates of each calculation and write the in a two-column file vs the cellsize
