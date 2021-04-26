# Band structure calculation
In a periodic solid, the eigenfunction of the system can be characterized by the reciprocal space vector **k** and a band index *n*.
It is useful to plot these Ψ(n,**k**) along high-symmetry paths which usually shows most of the interesting features.
  1. Run the self-consistent calculation using the provided input 'si.scf.in' to generate the ground state electronic charge density. As before, we use an automatically generated k-point set:
      ```
      % tail -2 si.scf.in 
      K_POINTS {automatic}
      4 4 4 1 1 1

      % pw.x < si.scf.in > si.scf.out
      ```
  2. Run the non-self-consistent (nscf/bands) calculation using the provided input 'si.bands.in' to generate a set of eigenvalues and eigenfunctions on specific k-points of the Brillouin zone. We now request several empty bands (6) in addition to the filled (4) ones via `  nbnd      = 10`. 
We also specify 6 points to define 5 "lines" in k-space that contain 8 or 1 points per line. Here the k-points are defined in cartesian coordinates in terms of 2π/alat; for other options see the documentation for [K_POINTS](http://https://www.quantum-espresso.org/Doc/INPUT_PW.html).
      ```
      % tail -8 si.bands.on
      K_POINTS {tpiba_b}
      6
      0.500 0.500 0.500 8 ! L
      0.000 0.000 0.000 8 ! Gamma
      0.000 1.000 0.000 8 ! X
      0.250 1.000 0.250 1 ! U
      0.750 0.750 0.000 8 ! K
      0.000 0.000 0.000 1 ! Gamma

      % pw.x < si.bands.in > si.bands.out
      ```
  The k-points coordinates can be chosen:
  - Manually by looking up a table of high-symmetry point for the system's lattice (FCC)
  ![BZ](Ref/fcc_brillouin.png?raw=true "BZ")
  - Using the XCrySDen `tools` -> `k-path selection` tool.
> NOTE: when saving the k-path specify the pwscf extension in the menu and IN THE FILE NAME or XCrySDen will use the wrong format
  3. Run the bands.x post-processing using the provided input 'si.bandspp.in'
      ```
      bands.x < si.bandspp-manual.in > si.bandspp.out
      ```
  4. Run the plotband.x post-processing specifying from console the input file 'Sibands.dat' (output of bands.x)
      ```
      plotband.x
      > Sibands.dat
      > -6.0 10.0
      > 
      > Sibands.ps
      > 6.377
      > 1 6.377
      ```
  Where the manual entry represents in the respective order:
  - Input file name
  - Energy range in eV
  - xmgr file name (best to leave blank)
  - postscript file name
  - Fermi energy
  - Tick spacing, 0 of the plot
  5. As an alternative to plotband.x, use the Sibands.gnuplot script to plot the Sibands.dat.gnu formatted file directly
      ```
      gnuplot
      gnuplot> load "Sibands.gnuplot"
      ```
  6. Look at the script 'run_bands' which will automate all the steps (the k-path need to be put manually when building the script)
