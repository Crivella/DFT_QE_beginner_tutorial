# Low-dimensional systems: convergence vacuum thickness
In this tutorial we investigate the role of the vacuum thickness. 
Recall that to study an isolated 2D graphene sheet we use a supercell full of empty space. The amount of vacuum (i.e. the distance between the periodically repeating layer replicas) is determined by the cell height. In this case, since we are  using ibrav=4, the cell height is defined by celldm(3)=c/a. Instead, the in-plane lattice parameter is given by celldm(1).

## Compute the work function
  1. First view the input file graphene.scf.in with xcrysden and verify the distance between layers is 27.8 bohr or 14.7 angstrom for the given value of celldm=6. 

  2. Since the repeated layers (images) are separated by empty space, we can compute the vacuum level. To do this, we compute the electrostatic potential V along the z axis. Near the atoms, V will show a dip, while far away from the atoms the potential will tend to a constant value: the vacuum level. The calculation is in two parts. First the potential is computed using pp.x in a 3D box defined by the cell (graphene.pot). 

  ```
  pw.x < graphene.scf.in > graphene.scf.out
  pp.x < pp.in > pp.out
  ```
Secondly, we make a planar average on (x,y) of the 3D data in graphene.pot:
  ```
  average.x < average.in > average.out
  ```
  This creates a file called "avg.dat". Rename it "avg.dat_az6".
  Note: average.x must be run in serial, so if you are using mpirun, use "mpirun -np 1 average.x"

  3. Now plot the data with gnuplot and extract the value in the middle of the vacuum. The potential is given in Rydberg units (1 Ry=13.606eV)
  ```
  gnuplot
  gnuplot> plot "avg.dat" w l
  ```
  Extract the value of the Fermi level from the SCF output. Finally, compute the work function (Evac-Efermi). The literature value for the work function of graphene is about 4.56eV.

## Converge the electrostatic potential and WF with the vacuum size
If the vacuum is large enough, the potential between layers is flat and we can say that the layers do not interact with their images, i.e. they are isolated. We can test this by varying the size of the vacuum until we reach convergence. Do this by changing celldm(3).

 1. Make a copy of the input file and change celldm(1) from 6 to 0.5.
    ```
    cp graphene.scf.in graphene.scf.in_az0.5
    vi graphene.scf.in_az0.5   (or use sed)
    pw.x < graphene.scf.in_az0.5 > graphene.scf.in_az0.5
    ```

 2. Run the post-processing
    ```
    pp.x < pp.in
    average.x < average.in > average.out
    mv avg.dat avg.dat_az0.5
    ```
    Have a look at the input file with xcrysden. What system are we modelling now?

 3. Repeat step 1 and 2 changing celldm(3) to 1,2,3,4,5,6 and compare the results. Change the name of avg.dat file each time.
    ```
    gnuplot
    gnuplot> plot for [i=1:6] "avg.dat_az".i t "celldm3 = ".i w l
    ```
    ![Dependence of electrostatic potential on cell size](Ref/graphene.scf.vacuum.png?raw=true "Potential vs cell size")

 4. Last, extract the Fermi level and vacuum level from the output files and plot the work function as a function of cell size. Convergence is reached for interplanar distance of about 10A. This is a typical minimum distance you should use for treating isolated systems. Other properties may need larger vacuums.

    ![Dependence of WF on cell size](Ref/work_function.png?raw=true "WF vs cell size")
 4. ADVANCED USERS: The script run_vacuum and run_plots in the Scripts folder will perform the above steps automatically. 

### When you have completed this tutorial, you can move on to [1_variable_cell: Variable cell optimization](../1_variable_cell)
