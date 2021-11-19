# UNDER CONSTRUCTION!!!

# Design a molecule from scratch
In this tutorial we will use Avogadro to create the pyrrole molecule, relax the structure with a force-field optimization, and then perform an accurate geometry optimization using quantum-ESPRESSO.
    ![Pyrrole structure](Ref/Pyrrole_structure.png?raw=true "pyrrole")

  1. Launch Avogadro. There is detailed Documentation on their website at https://avogadro.cc/docs/getting-started/drawing-molecules/
  - Using the first "Edit" tab, create the molecule.
  - Relax the molecule with a FF
  - Save the XYZ format as pyrrole.xyz
  - Check it with Xcrysden 
  ```
  xcrysden --xyz pyrrole.xyz
  ```

  2. Now create an input file for PWscf. The easiest thing is to copy and modify a previous file, i.e. one from the CO tutorial.
  ```
  cp ../../3_CO/CO.scf.in .
  cp CO.scf.in pyrrole.relax.in
  ```
  - We want to run a geometrical relaxation.
  - Choose pseudopotentials
  - Find the cutoff based on...TE or atomic forces
  - Geometry optimize
  - Plot H+L

### When you have completed this tutorial, you can move on to [1_variable_cell: Variable cell optimization](../1_variable_cell)
