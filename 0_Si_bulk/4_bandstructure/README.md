# Band structure calculation
In a periodic solid, the eigenfunctions Ψ(n,**k**) and eigenvalues E(n,**k**) of the system can be characterized by the reciprocal space vector **k** and a band index *n*.
It is useful to plot E(n,**k**) along high-symmetry paths which usually shows most of the interesting features.

  1. Run the self-consistent calculation using the provided input 'si.scf.in' to generate the ground state electronic charge density. As before, we use an automatically generated, regularly spaced, k-point grid:
      ```
      % tail -2 si.scf.in 
      K_POINTS {automatic}
      4 4 4 1 1 1

      % pw.x < si.scf.in > si.scf.out
      ```
      As this is a SCF run, we set `calculation = 'scf'` in the input file.
      By inspecting the output file, we see we have 8 electrons and 4 filled bands.

  2.  Run the non-self-consistent (nscf/bands) calculation using the provided input 'si.bands.in' to generate a set of eigenvalues and eigenfunctions on specific k-points of the Brillouin zone. There are two important changes to the input file:
      ```
      calculation = 'bands'
      nbnd        = 10
      ```
      We thus request several empty bands (6) in addition to the filled (4) ones. 

      We also specify 6 points that define 5 "symmetry lines" in k-space that contain 8 points per line (or 1 for a line of zero length). 
      Here the k-points are defined in cartesian coordinates in terms of 2π/alat; 
      for other options see the documentation for [K_POINTS](http://https://www.quantum-espresso.org/Doc/INPUT_PW.html).
      Note that the k-points are thus along a path in the BZ and do not form a grid like in the SCF calculation.
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
      Compare the output of the 'si.scf.out' and 'si.bands.out' files: note the difference in the k-point lists and in the SCF/NSCF iteration loops.

      The k-points coordinates can be chosen:
      - Manually by looking up a table of high-symmetry point for the system's lattice (FCC), e.g. from [Bilbao crystallographic server](https://www.cryst.ehu.es/cryst/get_kvec.html) or [1] or standard textbooks. 
      For example, bulk silicon has space group 227 (Fd-3m): click _Optimized listing_ and _include primitive basis_ to see the coordinates of various high symmetry points. 
      ![BZ](Ref/bands-mix.png?raw=true "BZ")
      - Or by using the XCrySDen `tools` -> `k-path selection` tool. Note: k-points are specified in 'crystal' units.
        NOTE: when saving the k-path specify the pwscf extension in the menu and IN THE FILE NAME or XCrySDen will use the wrong format.
      - Or by uploading your input file to the [SeekPath app](https://www.materialscloud.org/work/tools/seekpath)
      - Or read the DFT-basics/Doc/brillouin_zones.pdf guide.

  3.  The output from the previous step is not in a human-readable format. To plot an actual bandstructure, you must run the `bands.x` post-processing tool using the provided input 'si.bandspp.in'
      ```
      % bands.x < si.bandspp.in > si.bandspp.out
      ```
      This run analyses the symmetries of the eigenfunctions and writes the eigenvalues into a file called 'Sibands.dat.gnu', as defined in 'si.bandspp.in'.

  5.  Finally, plot the bandstructure with gnuplot:
      ```
      gnuplot> plot "Sibands.dat.gnu" w l
      ```
      It is common to redefine the energy zero as being at the top of the valence band (or at the Fermi level in a metal). The VBM lies at the Γ point in silicon, so it is easy to find in the 'si.bandspp.out' file. (It is not a point in the SCF k-grid.) Note that the Fermi level is written in the output of the *SCF* run (can you understand why?).
      ```
          k = 0.0000 0.0000 0.0000 (   411 PWs)   bands (ev):
                                                                        
      -5.8271   6.2154   6.2154   6.2154   8.7810   8.7810   8.7810   9.6565
      ```
      Plotting again but shifting the data by VBM we have
      ```
      gnuplot> plot "Sibands.dat.gnu" u 1:($2-6.2154) w l
      ```
      ![Si bandstructure](Ref/Sibands-nosym.png?raw=true "Si band structure")

  6. ADVANCED: You can also use the script 'run_bands' which will automate all the steps (the k-path need to be put manually when building the script) and also makes use of the `plotband.x` code. The gnuplot script 'Sibands.gnuplot' will create the image shown above from the 'Sibands.dat.gnu' file. 
      ```
      gnuplot> load "Scripts/Sibands.gnuplot"
      ```
## Bibliography
1.  Aroyo et al, Acta Cryst. (2014). A70, 126-137 [Link](https://doi.org/10.1107/S205327331303091X)
