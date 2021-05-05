# DOS

In this section we will calculate the Density of States of a germanium cluster Ge<sub>5</sub>H<sub>12</sub>.  With the codes we will be able to discretize the integrals in a limited range of number of bands and k-points.

## Steps

 1. Run a *scf* calculation to get a converged charge density
 2. Run a *nscf* calculation to get the eigenvalues od the system
 3. Compute and plot the DOS

## Running

 1. Move into the `Ge_cluster/DOS` directory
 2. Run the *scf* calculation with the command:
    ```
    % pw.x < Ge5H12.scf.in > Ge5H12.scf.out
    ```
 3. Run the *nscf* calculation:
    ```
    % pw.x < Ge5H12.nscf.in > Ge5H12.nscf.out
    ```
 4. Open the Ge5H12.dos.in file to check the included parameters. It will look like:
    ```
    &dos
    outdir='./tmp'
    prefix='Ge5H12'
    fildos='Ge5H12.dos.dat',
    degauss=0.01
    Emin=-5.0, Emax=30.0, DeltaE=0.01
    /
    ``` 

 5. Calculate the DOS with the `dos.x` code to get the Ge5H12.dos.dat file:
    ```
    % dos.x < Ge5H12.dos.in > Ge5H12.dos.out
    ``` 
 7. Plot the Ge5H12.dos.dat file with *gnuplot*:
     ```
      % gnuplot
      G N U P L O T

      Version 5.4 patchlevel 1  last modified 2020-12-01
      Copyright (C) 1986-1993, 1998, 2004, 2007-2020
      Thomas Williams, Colin Kelley and many others
  
      gnuplot home: http://www.gnuplot.info
      faq, bugs, etc: type "help FAQ"
      immediate help: type "help"  (plot window: hit 'h')

    Terminal type is now 'qt'
    gnuplot> plot  'Ge5H12.dos.dat'  u  1:2  t  'bnd5'  w  l lw 3  lc  rgb  'black'
    ```