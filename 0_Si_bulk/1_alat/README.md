# Theoretical lattice parameter
The lattice parameter of our theoretical system in principle is not the same of the experimental one.
We can use the experimental value as an initial guess (or atomic bond leghts if the experiment is not available).
We then need to minimize the total energy with respect of all possible lattice parameter.
  1. Run the self-consistent calculation varying the latticle parameter celldim(1) from 10.00 to 10.35 in steps of 0.05
      ```
      change celldim(1) to 10.00
      pw.x < si.scf-manual.in > si.scf-manual.out_10.00
      ...
      change celldim(1) to 10.35
      pw.x < si.scf-manual.in > si.scf-manual.out_10.35
      ```
  2. Use grep to collect the total energies from all files in one command
      ```
      grep -e "!" *
      ```
  3. Save the lattice parameters and total energies in a 2 column file and plot it
  4. Use the gnuplot script DoFit.gnu or another tool to fit the obtained data with the Murnaghan state equation
  5. Look at the script 'run_alat' which will do all the steps automatically
