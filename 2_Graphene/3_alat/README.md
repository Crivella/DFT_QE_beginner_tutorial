# Variable cell relaxation
In this tutorial we investigate how to perform a structural relaxation in which both the atomic positions and cell parameters are allowed to vary. It is an alternative method to obtain the lattice parameters.

Recall that to study an isolated 2D graphene sheet we use a supercell full of empty space. The amount of vacuum (i.e. the distance between the periodically repeating layer replicas) is determined by the cell height. In this case, since we are  using ibrav=4, the cell height is defined by celldm(3)=c/a. Instead, the in-plane lattice constant is given by celldm(1).

## Free relax
  1. First view the input file graphene.vc-relax-free.in. There are a few new variables and namelists:
  ```
  calculation='vc-relax'
  [...[
  &IONS
  /
  &CELL
  /
  ``` 
  The &IONS namelist allows the atoms to move within the unit cell. Actually, they are already in their equilibrium positions and will not move from there. 
  Run the code and look at the output animation with xcrysden
  ```
  pw.x < graphene.vc-relax-free.in > graphene.vc-relax-free.out
  xcrysden --pwo graphene.vc-relax-free.out
  ```
  The supercell flattens due to interaction between the layers, and the system ends up in some kind of bulk graphite structure with an AA stacking. Not what we want here!

  2. Let's constrain the geometry optimization to keep the vertical cell parameter fixed. Contraints are introduced with the `cell_dofree` variable. Look at graphene.vc-relax-2Dxy.in:
  ```
  &CELL
     press_conv_thr=0.001
     cell_dofree="2Dxy"
  !  cell_dofree="ibrav+2Dxy"   ! QE 7.0
  /
  ```
  and run the code. Demonstrate that the final cell parameter is 4.46 bohr.
  ```
  pw.x < graphene.vc-relax-2Dxy.in > graphene.vc-relax-2Dxy.out
  xcrysden --pwo graphene.vc-relax-2Dxy.out
  ```

  3. The full power of vc-relax can be seen by running the input file graphene.vc-relax-buckled.in. Here, the graphene sheet has a buckled configuration. Show that the vc-relax calculation succeeds in returning to the flat geometry with the correct cell parameter.
  ```
  pw.x < graphene.vc-relax-buckled.in > graphene.vc-relax-buckled.out
  xcrysden --pwo graphene.vc-relax-buckled.out
  ```
  
  4. Last, let's change slightly the initial positions and cell parameter of the buckled sheet. What happens now?
  ```
  pw.x < graphene.vc-relax-buckled2.in > graphene.vc-relax-buckled2.out
  xcrysden --pwo graphene.vc-relax-buckled2.out
  ```
  The message here is: vc-relax cannot work miracles! If you start too far from the global minimum, the code might not be able to find it. It is easy to generate metastable (or garbage) geometries. Symmetry of the system also plays a crucial role. The code will not break symmetries during a run, and thus will never find an ABA graphite structure. Use vc-relax with care, and always check the output files.

### When you have completed this tutorial, you can move on to [4_spin: Spin polarization in a graphene nanoribbon](../4_spin)
