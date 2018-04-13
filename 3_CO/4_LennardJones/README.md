# LennardJones
The potential curve that ties the total energy of a system with 2 neutral atoms and their distance is the well known Lennard-Jonse potential.
It is defined by a power relation with exponents 12 (for the repulsive component) and 6 (for the attractive component).
In our case we have 2 atoms that form a chemical bond, so we expect to not find an exact L-J poptential, but a similar function where we relax the exponents from (12,6) to (2n,n).

## Purpose
  1. Look at the potential curve between 2 atoms forming a chemical bond

## Runing the exercise
  1. Run the script 'run_lj' to perform a series of scf calculations with different bond lenghts. The script will save the total energy for each calcuation
      ```
      ./run_lj
      ```
  2. Use the gnuplot script DoFit.gnu to perform a parabolic and L-J fit on the obtained data
      ```
      gnuplot DoFit.gnu
      ```
