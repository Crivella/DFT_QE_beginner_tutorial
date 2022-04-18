# Convergence on the kinetic energy cutoff
Like in the bulk Si tutorial, we start by testing convergence with respect to the kinetic energy cutoff, ecutwfc.
  1. First take a look at the system with xcrysden.
      ```
      % xcrysden --pwi graphene.scf.in
      ```
      First leave "Do not reduce dimensionality" checked.
      Click Modify -> Numer of units drawn -> Expand to 3x3x3.
     ![Graphene geometry](Ref/graphene-supercell.png?raw=true "Graphene geometry")
      We have constructed what is known as a "supercell". Each supercell contains a thin slab sandwiched between thicker layers of empty space (vacuum). The unit cell contains 2 atoms of C, and the slab is only a single atom thick (a monolayer). Since quantum-ESPRESSO uses periodic boundary conditions, the system is composed of infinite sheets in the x-y plane, separated by vacuum. We will look more closely at the geometry in the following tutorials. First, however, we must carry out some convergence tests.

  2. As in the case of bulk Si, we start with the kinetic energy cutoff. Change the value of `ecutwfc` from 10 up to 100 Ry in regular steps. Change the name of the output file each time.
      ```
      % pw.x < graphene.scf.in > graphene.scf.in_10Ry
      ```
      You can also make this change directly to the original input file using the `sed` command:
ecutwfc = 20
      ```
      % sed -e 's/ecutwfc = 20/ecutwfc = 10/' graphene.scf.in > graphene.scf.in_ecut
      % grep 'ecutwfc' graphene.scf.in_ecut 
      ecutwfc   = 10,
      % pw.x < graphene.scf.in_ecut > graphene.scf.out_10Ry
      ```
      Repeat for 10,20,30,50,70,100 Ry.
      ```
      [...]
      % pw.x < graphene.scf.in_ecut > graphene.scf.out_100Ry
      ```
  4. Using grep (See Si bulk tutorial) paste the cutoffs and total energies into a 2 column file (Ecut,Etot) called 'Etot_vs_Ecut.dat' and plot it. 

     ![Total energy vs kinetic energy cutoff](Ref/Etot_vs_Ecut.png?raw=true "Total energy vs kinetic energy cutoff")

     You will notice that a much higher cutoff is needed for C than for Si, for the same pseudopotential: we say C is "harder" than Si.     For the sake of this tutorial, however, let's keep a low cutoff of 20 Ry.
  6. ADVANCED USERS: The shell scripts 'run_ecut' and 'run_plots' in the 'Script' directory will do everything automatically from step 3 to 5 (explained using comments inside the script). You may first have to modify the ENVIRONMENT_VARIABLES file in the root directory. The scripts must be run from the main 0_cutoff directory (or copied there). Hit 'q' to cycle through plot windows as they appear. Inspect the PDFs or PNGs that are created.
      ```
      ./Script/run_ecut
      ./Script/run_plots
      ```
      NB: Do not use the scripts for your own projects unless you understand well how they work!
      
### When you have completed this tutorial, you can move on to [1_kpoints: Convergence with k-points](../1_kpoints)
