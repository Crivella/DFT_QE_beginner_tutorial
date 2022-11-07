# Low dimensional systems
In this tutorial we investigate a thin (1 monolayer) sheet of boron nitride.
Since quantum-ESPRESSO works only with periodic systems, we create a supercell full of empty space in order to mimic a truly isolated 2D sheet.
  1. Examine the input file BN.scf.in 
  ```
  cat BN.scf.in
  ...
  &system
    ibrav             = 4
    celldm(1)         = 4.68
    celldm(3)         =  6
  ... 
  ```
  and view it with Xcrysden (do not reduce dimensionality). 
  Verify that the distance between layers is given by 4.68 bohr x 6 = 14.85 Angstrom (this is the meaning of celldm(3) when ibrav=4, i.e. c/a).
    ![BN supercell](Ref/BN.scf.png?raw=true "BN supercell")

  2. Since the repeated layers (images) are separated by empty space, we can compute the vacuum level. To do this, we compute the electrostatic potential V along the z axis. Near the atoms, V will show a dip, while far away from the atoms the potential will tend to a constant value: the vacuum level. The calculation is in two parts. First the potential is computed using pp.x in a 3D box defined by the cell (BN.pot). Then we make a planar average on (x,y) of BN.pot for a set of z values:
  ```
  pw.x < BN.scf.in > BN.scf.out   
  pp.x < pp.in
  average.x < average.in > average.out
  ```
  This creates a file called "avg.dat".
  Note: average.x must be run in serial, so if you are using mpirun, use "mpirun -np 1 average.x"

  3. Now plot the data with gnuplot and extract the value in the middle of the vacuum. The potential is given in Rydberg units (1 Ry=13.606eV)
  ```
  gnuplot
  gnuplot> plot "avg.dat" w l
  ```

  4. Compute the ionization energy for the BN sheet, using IE=Evac - VBM. 

# Test vacuum size
If the vacuum is large enough, the potential between layers is flat and we can say that the layers do not interact with their images, i.e. they are isolated. We can test this by varying the size of the vacuum until we reach convergence. Do this by changing celldm(3).

 1. Make a copy of the input file and change celldm(1) from 6 to 1:
    ```
    cp BN.scf.in BN.scf_cdm1.in
    vi BN.scf_cdm1.in   (or use sed)
    pw.x < BN.scf_cdm1.in > BN.scf_cdm1.out  
    ```

 2. Run the post-processing
    ```
    pp.x < pp.in
    average.x < average.in > average.out
    mv avg.dat avg_cdm1-plot.dat
    ```

 3. Repeat step 1 and 2 changing celldm(3) to 1,2,3,4,5,6 and compare their results. Change the name of the input and avg.dat file each time.
    ```
    gnuplot
    gnuplot> plot for [i=1:6] "avg_cdm".i."-plot.dat" t "cdm".i w l
    ```
    ![Dependence of electrostatic potential on cell size](Ref/Vacuum.png?raw=true "Potential vs cell size")

 4. ADVANCED USERS: The script run_vacuum in the Scripts folder will perform steps 1-2 automatically. Note also the use of a function, called by the script, to create an input file for each celldm(3).

### When you have completed this tutorial, you can move on to [1_variable_cell: Variable cell optimization](../1_variable_cell)
