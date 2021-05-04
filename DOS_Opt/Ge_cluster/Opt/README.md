# Dielectric Function 

Dielectric function, as well as the DOS, is a quantity that requires the integration over the whole Brillouin zone. Ge<sub>5</sub>H<sub>12</sub>.  In general, in order to produce reliable data, a convergency test over the size of the k-point mesh needs to be run. Since the optical properties depends on both occupied and unoccupied states, another convergency test over the number of bands *nbnd* must be performed.

## Steps

 1. Run a *scf* calculation to get a converged charge density
 2. Run a *nscf* calculation to get the eigenvalues od the system
 3. Compute de matrix elements and the dielectric function  components 
 4. Plot the imaginary part of the dielectric function vs energy.

## Running

 1. Move into the `Ge_cluster/Opt` directory
 2. Run the *scf* calculation with the command:
    ```
    % pw.x < Ge5H12.scf.in > Ge5H12.scf.out
    ```
 3. Run the *nscf* calculation:
    ```
    % pw.x < Ge5H12.nscf.in > Ge5H12.nscf.out
    ```
 4. Open the Ge5H12.pw2gw.in file to check the included parameters. It will look like:
    ```
      &inputpp
	  prefix='Ge5H12',
	  outdir='./tmp'
	  what='gw',
	  qplda=.false.,
	  vxcdiag=.false.,
	  vkb=.false.,
	  Emax=10.0
	  DeltaE=0.02
	  /
    ``` 
 5. Calculate the $\varepsilon$ <sub>2</sub> with the `pw2gw.x` code to get the matrixelements and the epsX/Y/Z/TOT.dat files:
    ```
    % pw2gw.x < Ge5H12.pw2gw.in > Ge5H12.pw2gw.out
    ``` 
 7. Plot the epsTOT.dat file with *gnuplot*:
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
    gnuplot> plot  'epsTOT.dat'  u  1:2  w  l lw 3  lc  rgb  'black'
    ```