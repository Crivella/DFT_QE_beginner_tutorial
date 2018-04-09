# Band structure calculation
In a periodic solid, the eigenfunction of the system can be characterized by the reciprocal space vector k and a band index.
It is useful to plot these psi_n,k along an high-symmetry path which usually shows most of the interesting feature.
  1. Run the self-consistent calculation using the provided input 'si.scf-manual.in'
      ```
      pw.x < si.scf-manual.in > si.scf-manual.out
      ```
  2. Run the non-self-consistent(nscf) calculation using the provided input 'si.bands-manual.in'
       ```
      pw.x < si.bands-manual.in > si.bands-manual.out
      ```
  The k-points coordinates can be choosen:
  - Manually by lokking up a table of high-symmetry point for the system's lattice
  - Using the XCrySDen 'tool -> k-path selection' tool.
      NOTE: when saving the k-path specify the pwscf extension in the menu and IN THE FILE NAME or XCrySDen will use the wrong format
  3. Run the bands.x post-processing using the provided input 'si.bandspp.in'
      ```
      bands.x < si.bandspp.in > si.bandspp.out
      ```
  4. Run the plotband.x post-processing specifing from console the input file 'Sibands.dat' (output of bands.x)
      ```
      plotband.x
      > Sibands.dat
      > -6.0 10.0
      > Sibands.xmgr
      > Sibands.ps
      > 6.377
      > 1 6.377
      ```
  Where the manual entry represents in the respective order:
  - Input file name
  - Energy range in eV
  - xmgr file name
  - postscript file name
  - Fermi energy
  - Tick spacing, 0 of the plot
  5. Look at the script 'run_bands' which will automate all the steps (the k-path need to be put manually when building the script)
