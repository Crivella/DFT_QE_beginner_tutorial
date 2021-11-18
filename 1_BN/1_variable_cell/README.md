# Variable cell relaxation
In this tutorial we will optimize the BN monolayer lattice constant by using an iterative relaxation scheme implemented in quantum-ESPRESSO. Here, both the atomic positions as well as the cell lattice vectors are allowed to change while the forces and stresses in the cell are minimized.

  1. Examine the input file BN.vc-cell.in 
  ```
  cat BN.vc-cell.in
  ...
  &ions
    ion_dynamics='bfgs',
    upscale=10
  /
  &cell
    cell_dofree='2Dxy'
  /
  ... 
  ```
  In the &cell namelist the variable cell_dofree imposes some constraints on the optimization. For instance, you might want to keep the volume constant, or keep the angles fixed, etc. In this case we do not want to allow the cell vector between images to vary (a3). From the documention we understand '2Dxy' describes best our requirements.

  2. Now we simply launch the code.
  ```
  pw.x < BN.vc-cell.in > BN.vc-cell.out   
  ```
  As you can imagine, this type of run can be very slow. Here, we are fortunate that the atomic forces are always zero, so only the stresses vary. When finished, view the output with Xcrysden as an animation.
  ```
  xcrysden --pwo BN.vc-cell.out
  ```

  3. Now try the same with the file BN.vc-cell-atoms.in, for which the N atoms have been shifted also out-of-plane.

  4. ADVANCED USERS: Try using other settings for cell_dofree.
