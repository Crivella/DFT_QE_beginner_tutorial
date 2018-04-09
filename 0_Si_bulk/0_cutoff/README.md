# Convergency on the kinetic cutoff
QE expands the wavefunctions on a plane wave(PW) basis set.
As with any set, an infinite number of function is required to perfectly represent the original function.
We need to limit the number of PW to the smallest number that represent our system accurately
Look at the file Docs/DFT1.pdf page 16-18
  1. Run the calculation using the provided input file:
      ```
      pw.x < si.scf-manual.in > si.scf-manual.out
      or to use multiple processors (parallel run) (require parallel version to be compiled)
      mpirun -np 2 pw.x < si.scf-manual.in > si.scf-manual.out
      ```
  2. Look at the information presented on the output file ('Docs/OUTPUT_PW' run with verbosity = 'high')
  		- An header containing information of the version of espresso used
      - A recap on the information of the system
      - A list of matrix representation of the symmetries of the system + the character table of the symmetries
      - The list of the point in k-space used
      - The information on each self-consistent iteration
      - The eigenvalues and occupations for the requested Kohn-Sham states at every k-point
      - The total energy marked by a ! ( as a sum of different contributions)
      - The forces acting on the atoms (should be 0 for a system at the equilibrium)
      - Information on the time for each subroutine (Usefule for big calculation)
  3. Repeat step 1 and change each time the value of ecutwfc from 5 up to 30 and the name of the output as to not override them
      ```
      pw.x < si.scf-manual.in > si.scf-manual.out_5
      change ecutwfc 5 -> 10
      pw.x < si.scf-manual.in > si.scf-manual.out_10
      ...
      change ecutwfc 25 -> 30
      pw.x < si.scf-manual.in > si.scf-manual.out_30
  4. Use grep to collect the total energies from all files in one command
      ```
      grep -e "!" *
      ```
  5. Save the cutoff energies and total energies in a 2 column file and plot it to see if you have reached convergence
  6. The script 'run_ecut' which will do automatically everything from step 3 to 5 (explained using comments inside the script)
      ```
      ./run_ecut
      ```
