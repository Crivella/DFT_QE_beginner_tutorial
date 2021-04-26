# K-point convergence
A second parameter that must be converged is the number of k-points that are used to perform integrals over the Brillouin zone. A list of k-points can be specified manually or generated automatically via the 'automatic' keyword. For the latter, QE uses a regular Monkhorst-Pack grid defined by a set of three integer folding parameters and three offsets. The density of points needed is inversely proportional to the size of the unit cell, and should be converged with respect to the total energy. In contrast to the kinetic energy, however, the convergence with k is not necessarily monotonous.

  1. In the provided input files we have used alat=10.21 a.u. and ecutwfc=20 as determined from the previous steps. 
     Run the self-consistent calculations for increasing k-point mesh density via the folding parameter NxNxN:
      ```
      % pw.x < si.scf.in_2x2x2 > si.scf.out_2x2x2
      [...]
      % pw.x < si.scf.in_10x10x10 > si.scf.out_10x10x10
      ```
  2. Use grep to collect the total energies and total number of k-points (nkpt) from all files in one command
      ```
      % grep -e '!' -e "number of k points" si.scf.out_*
      si.scf.out_10x10x10:     number of k points=   110
      si.scf.out_10x10x10:!    total energy              =     -15.84773062 Ry
      [...]
      ```
  3. Save the results in a 3 column file (N,nkpt,Etot) called 'Etot_vs_kgrid.dat' and plot them:
     ```
     gnuplot> plot "Etot_vs_alat.dat" u 1:3 w lp  
     ```
     ![k-point convergence](Ref/Etot_vs_kpoints.png?raw=true "k-point convergence")
  4. Use grep to extract the eigenvalues around the gap:
     ```
     % grep -e 'highest' si.scf.out_*
     si.scf.out_10x10x10:     highest occupied, lowest unoccupied level (ev):     6.1581    6.8275
     [...]
     ```
     Write the data in a 3 column file (N,VBM,CBM) called 'Gap_vs_kgrid.dat' and plot the gap with gnuplot
     ```
     gnuplot> plot "Gap_vs_kgrid.dat" u 1:($3-$2) w lp
     ```
     ![k-point convergence of gap](Ref/Gap_vs_kgrid.png?raw=true "k-point convergence of gap")
     Unlike the total energy, the gap does not converge well with k-points! Why is this, and is it a problem?

  5. ADVANCED: Previously we have specified an offset "N N N 1 1 1" in the k-point list. This causes the k-grid to be shifted away from the origin, i.e., it does not contain the gamma point. You could instead use no offset "N N N 0 0 0", however it often turns out to be less efficient. Demonstrate that this is the case for bulk silicon by repeating the above calculations and removing the offset each time.
     ![k-point convergence and offset](Ref/Etot_vs_kgrid.dat.png?raw=true "effect of offset")
  6. ADVANCED: Investigate the effect of using odd folding parameters (e.g. 3 3 3 1 1 1 and 3 3 3 0 0 0). Is it more or less efficient than before? Why?
  7. ADVANCED: Use the 'run_kpoints' and 'run_plots' scripts in the 'Scripts' directory to run 1-3 and 5 automatically.
     Do not use the scripts for your own projects unless you understand well how they work!

### When you have completed this tutorial, you can move on to [3_charge: Computing the charge density](../3_charge)
