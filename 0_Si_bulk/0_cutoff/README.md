# Convergency on the kinetic cutoff
QE expands the wavefunctions on a plane wave(PW) basis set.
As with any set, an infinite number of function is required to perfectly represent the original function.
We need to limit the number of PW to the smallest number that represent our system accurately
Look at the file Docs/DFT1.pdf page 16-18
  1. Run the calculation using the provided input file:
      ```
      pw.x < si.scf.in > si.scf.out
      ```
      or to use multiple processors, if quantum-espresso has been compiled in parallel
      ```
      mpirun -np 2 pw.x < si.scf.in > si.scf.out
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
  3. Repeat step 1 and change each time the value of ecutwfc from 5 up to 30 and the name of the output as to not overwrite them
      ```
      pw.x < si.scf.in > si.scf.out_5Ry
      ```
      Modify (edit) the si.scf.in file and change ecutwfc 5 -> ecutwfc 10
      ```
      pw.x < si.scf.in > si.scf.out_10Ry
      ```
      You can also make this change directly to the original input file using the 'sed' command:
      ```
      sed -e 's/ecutwfc   = 5/ecutwfc   = 10/' si.scf.in > si.scf.in_10Ry
      pw.x < si.scf.in_10Ry > si.scf.out_10Ry
      ```
      Repeat for 15,20,25 and 30 Ry
      ```
      ...
      pw.x < si.scf.in > si.scf.out_30Ry
      ```
  4. Use grep to collect the total energies from all files in one command
      ```
      grep -e '!' *out*Ry
      ```
     Save the cutoff energies and total energies in a 2 column file called Etot_vs_ecut.dat and plot it to see if you have reached convergence. 
     A possible (but tight) threshold is 1meV/atom. An example file and plot is given in the Ref folder.
  5. Use grep to extract the eigenvalues of the highest occupied and lowest unoccupied bands, and compute the band gap
      ```
      grep -e 'highest' * | awk '{print $7,$8,$8-$7}'
      ```
     Save the energies (VBM,CBM,gap) in a 4 column file and plot them versus the cutoff. How does the convergence compare with the value expected from the total energy run?
  6. ADVANCED USERS: The scripts 'run_ecut' and 'run_plots' in the Script directory will do everything automatically from step 3 to 5 (explained using comments inside the script). They must run from the main 0_cutoff directory (or copied there). Inspect the PDFs that are created.
      ```
      ./Script/run_ecut
      ./Script/run_plots
      ```
      
