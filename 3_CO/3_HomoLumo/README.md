# HOMO and LUMO calculation
As with any molecule, we can define the Highest Occupied Molecular Orbital (HOMO) and Lowest Unoccupied Molecular Orbital (LUMO).
We can visualize them using `pp.x`, by plotting the charge density for a specific k-point and band.

## Purpose
  1. Use pp.x to visualie the HOMO and LUMO of a molecule

## Running the exercise
  1. Recompute the ground state geometry and charge density of the CO molecule using a box size of 12 bohr. Note that we have placed the molecule in the centre of the cell. which makes visualization easier.
      ```
      % pw.x < co.relax.in > co.relax.out
      ```
      Look in the output file for the number of electrons and work out which band indices corresponds to the HOMO and LUMO. Check your answer by inspecting the eigenvalues and occupations.
  2. Use `pp.x` to plot the charge density for the HOMO. Actually, because there is only the Gamma point, you can ask to plot also the phase via `lsign =.true.` View the result in 3D with Xcrysden, choosing a suitable isovalue.
      ```
      % pp.x < co.pp.in > co.pp.out
      % xcrysden --xsf psi2_size12_ib5.xsf
      ```
  3. Repeat for the LUMO at 12 bohr, and then for both HOMO and LUMO at 5 bohr. Save an image in each case.
     ![HOMO and LUMO](Ref/psi2_all.png?raw=true "HOMO-LUMO vs cell size")
     
  4. ADVANCED: Run the script 'Script/run_pp' do steps 1-3, and view the output files with Xcrysden.

