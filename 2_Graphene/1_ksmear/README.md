# Convergence on the smearing and k-points
Convergence with k-points is more complicated for graphene than for bulk Si for a number of reasons: 
* First, the c-axis of the supercell is very large compared to the xy-axes. The Brillouin zone is thus very flat. 
* Second, the system is hexagonal, which impacts our choice of mesh. 
* Third, graphene is a semi-metal or zero-gap semiconductor, because its conduction and valence bands meet at the same points (Dirac points). Thus, it should be treated the same way as a metal, and k-point integration should be modified to include "smearing".
     ![Graphene electronic properties](Ref/graphene-BZ.png?raw=true "Graphene electronic properties")
1. First take a look at the Brillouin zone.the system with `xcrysden`.
      ```
      % xcrysden --pwi graphene.scf.in
      ```
      First leave "Do not reduce dimensionality" checked.
      Click `Tools` -> `k-path selection`, and verify the BZ is compressed along the z direction.
      Identify the coordinates of the special point K, and exit.
      Now look at the input file itself:
      ```
      K_POINTS automatic
      3 3 1	0 0 0
      ```
      Notice that we use a 2D grid of k-points in the xy-plane: there is no need to sample in the z-direction as the BZ is almost flat.
      Now run the code, saving the output file
      ```
      % pw.x < graphene.scf.in > graphene.scf.out
      ```
      Notice that this choice of k-point grid (odd, unshifted) includes the K point (i.e. the position of the zero gap) by design.
      ```
                             cryst. coord.
        k(    1) = (   0.0000000   0.0000000   0.0000000), wk =   0.2222222
        k(    2) = (   0.0000000   0.3333333   0.0000000), wk =   1.3333333
        k(    3) = (   0.3333333   0.3333333   0.0000000), wk =   0.4444444
      ```
      Check the size of the band gap by looking at the eigenvalues.

2. The other main change in the input file is the introduction of `smearing`. Smearing is a mathematical trick implemented in DFT codes to help convergence in metallic systems. It is needed due to the sharp change in occupation that occurs when crossing the Fermi level: during the SCF cycle, a band can jump from being occupied in one step to unoccupied in the next, leading to a phenomenon called charge sloshing that hinders convergence. To overcome this, we replace the step function that describes the occupations with a smoother distribution, e.g. the Fermi-Dirac one. In quantum-ESPRESSO there are several possibilities: `gaussian`, `fermi-dirac`, `methfessel-paxton`, and `marzari-vanderbilt` (cold) smearing. The width of the smearing function, sigma, is determined by the parameter `degauss`.
      ```
      occupations = 'smearing' ,
      degauss = 0.10 ,
      smearing = 'gaussian' ,
      ```
      The convergence with k-points depends on the smearing. However, the final results should not depend on the smearing. Hence we must test convergence on k-points and smearing simultaneously. 
      
      First let's test gaussian smearing. Set degauss to 0.1 Ry, and modify the input file to use 3x3x1, 6x6x1, 9x9x1, and 12x12x1 k-point grids. Then lower the smearing to 0.05, 0.01, and 0.003, repeating the convergence with k each time.
      ```
      % pw.x < graphene.scf.in > graphene.scf.out_g0.1_3x3x1_gaussian
      % pw.x < graphene.scf.in > graphene.scf.out_g0.1_6x6x1_gaussian
      ...
      % pw.x < graphene.scf.in > graphene.scf.out_g0.003_12x12x1_gaussian
      ```
      When you've finished, collect the data in file called `Etot_vs_kgrid.dat_gaussian` for plotting:
      ```
      # Sigma N       	      NxNxN           NKTOT            energy(Ry)
      0.003   3               3x3x1           3               -22.10194804
      0.01    3               3x3x1           3               -22.10370330
      0.05    3               3x3x1           3               -22.11373333
      0.1     3               3x3x1           3               -22.12628303
 
 
      0.003   6               6x6x1           7               -22.14608533
      0.01    6               6x6x1           7               -22.14652414
      ...
      ```
      Last, repeat the exercise for `marzari-vanderbilt` smearing. Plot the total energy as a function of smearing and k-point grid.
      A complete set of data is also provided in the Ref folder.
     ![Smearing in graphene](Ref/smearing.png?raw=true "Smearing")
      
      In principle we are converging the calculation with k-points for each value of degauss. At higher smearing (>0.1Ry), it is clear the data is not converged with k-points. Of course, it depends on the precision required. The blue box in the figure indicates +/-1meV/atom range about the converged value.

      Graphene is something of a special case. The convergence is quite different for a true metal like Al. In that case, one cannot  reduce the smearing too much: the energy levels must have some overlap, or else the advantage of broadening is lost.

3.  ADVANCED USERS: Clearly, these tests are very tedious. It is better to use a bash script to automate the process.
      Try running the scripts in the Script folder
      ```
      % ./Script/run_smearing
      % ./Script/run_plots
      ```
      As before, modify ENVIRONMENT_VARIABLES appropriately if necessary.

      NB: Do not use the scripts for your own projects unless you understand well how they work!
      
### When you have completed this tutorial, you can move on to [2_vacuum: Convergence with vacuum](../2_vacuum)
