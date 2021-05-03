# Convergence over amount of vacuum
In this tutorial we consider an isolated system, the CO molecule. Since we are using a code based on Bloch's theorem for periodic systems, we must adopt a supercell scheme in which the molecule is surrounded by vacuum in all directions.
The amount of vacuum has to be determined through a convergence test. We can do this before determining the kinetic energy cutoff.
Once a large enough vacuum is used, quantities such as the bond length, HOMO-LUMO gap, binding energy, ionization potential, or total energy, etc, should not vary if we further increase the vacuum (i.e., the cell size): what observable parameter we monitor depends on what we want to compute.

In this exercise we only know that we have a carbon and an oxygen atom and rough guess of the distance between them.
We could run several calculations for each possible distance and find the minimum by fitting the data with a Lennard-Jones potential, but in this case it is easier to let QE do the work for us, by moving the atoms position according to the forces acting on them ('relax' calculation)

# Purpose
  1. Run a relax calculation
  2. Run a calculation for a 0D system

## Running the exercise
  1. First look at the provided 'co.relax.in' file. You will notice a number of changes with respect to the bulk Si calculation. First, there are new variables that indicate a structural relaxation run. The calculation type is 'relax', a force threshold is indicated, a new namelist IONS is given, and the atomic positions are followed by three integers that indicate which atomic components are fixed (0) or free (1) to move. (If nothing is specified, the default is 1 1 1). The initial bond length is 2.256 a.u.
     ```
     calculation  = "relax",
     forc_conv_thr = 1.0D-3
     &IONS
        ion_dynamics = "bfgs"
     /
     ATOMIC_POSITIONS {bohr}
     C  2.256  0.0  0.0  1 0 0
     O  0.000  0.0  0.0  0 0 0
     ```
     Secondly, a (cubic) supercell of side 10 a.u. is indicated explicitly, and only the Gamma-point is used:
     ```
     CELL_PARAMETERS {bohr}
     10  0.0  0.0
     0.0  10  0.0
     0.0  0.0  10
     K_POINTS {Gamma}
     ```
     Look at the structure of the supercell with `Xcrysden`:
     ```
     % xcrysden --pwi co.relax.in
     ```
     When prompted, select "Do not reduce dimensionality" and add a few more cells with `Modify` -> `Number of units drawn` -> `2,2,2`. Check that the C-O bond length is 2.256 a.u. and that the *minimum* distance between a molecule and its image is 7.74 a.u.

  2. Launch the code to run the optimization and view the output with `XCrysden`
     ```
     % pw.x < co.relax.in > co.relax.out
     % xcrysden --pwo co.relax.out
     ```
     When the Xcrysden windows open, select `Display all coordinates as animation` and view the exciting movie. What is the final C-O distance?
     
     Use `grep` to see how the interatomic distance changes with each iteration step.
     % grep -A2 ATOM co.relax.out                    # -A2 means "show also the 2 lines following each matching line"

  3. One way to visualize the interaction (if any) between repeating images is by looking at the electrostatic potential within the cell. To do this we use the post-processing tool `pp.x`. We ask that the 3D potential data is computed and written to a file 'CO.pot' and that xcrysden-readable data is written to standard output:
     ```
     % pp.x < co.pp.in > co.pp.out
     ```
     While you could use Xcrysden to plot the 3D data written to 'co.pp.out', it is more useful to perform a planar average (in the yz-plane) and plot this as a function of x. To do this we use another postprocessing code called `average.x` which reads the 'CO.pot' file. NB: `average.x` must be run on one processor. 
     ```
     % average.x < co.avg.in
     [...]
     Reading data from file  CO.pot
     Output written to file avg.dat
     ```
     Finally, you can plot the 'avg.dat' file. What does the result tell you?

  4. Now repeat steps 2-3 using a smaller and a larger lattice constant of 5 bohr and 15 bohr, respectively. Change the lattice constants in the CELL_PARAMETERS block for all three cartesian directions. Save the 'avg.dat' file with an appropriate name in each case:
     ```
     % mv avg.dat avg.dat_10bohr
     % mv co.relax.out co.relax.out_10bohr
     % vi co.relax.in 		[change 10 -> 5]
     % pw.x < co.relax.in > co.relax.out_5bohr
     % pw.x < co.pp.in > co.pp.out
     % average.x < co.avg.in
     % mv avg.dat avg.dat_5bohr
     [...]
     % mv avg.dat avg.dat_15bohr
     ```
     Plot the three potential files. Note that they show data in Ry. What can you conclude? 
  5. Use grep to extract the following information from the three output files at 5,10 and 15 bohr:
     - The bond length (i.e. the x-position of the C atom)
     - The final total energy (Hint: search for 'Final')
     - The HOMO energy (Hint: search for 'highest')

     Use the values of the electrostatic potential in the middle of the vacuum to estimate the ionization potential (Evac-HOMO). Prepare a file containing the columns (cell size,bond length,Etot,IP), and plot the computed quantities as a function of the cell size. Which kinds of data are better behaved?
  6. ADVANCED: Use the provided script 'run_cellsize' to run several relax calculation for a large range of different cellsizes.
     Do NOT use the scripts for your own projects until you understand well how they work!
     ```
     ./Script/run_cellsize
     ```
     Note how the bond length does not change smoothly. Why is this?
      ![bond vs size](Ref/bond_length-script.png?raw=true "potential vs cell size")
      ![potential vs size](Ref/potential-script.png?raw=true "potential vs cell size")
      
