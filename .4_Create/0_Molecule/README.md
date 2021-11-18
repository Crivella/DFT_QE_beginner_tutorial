# UNDER CONSTRUCTION!!!

# Design a molecule from scratch
In this tutorial we will use Avogadro to create a new molecule (pyrrole), relax the structure with a force-field optimization, and then perform an accurate geometry optimization using quantum-ESPRESSO.
IMAGE
  1. Launch Avogadro. There is detailed Documentation on their website at https://avogadro.cc/docs/getting-started/drawing-molecules/
  - Using the first "Edit" tab, create the molecule.
  - Relax the molecule with a FF
  - Save the XYZ format.
  

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

  2. Now create an input file for pwscf/xcrysden. The easiest thing is to copy and modify a previous file, i.e. one from the CO tutorial.
  ```
  cp ../../3_CO/CO.scf.in .
  cp CO.scf.in pyrrole.relax.in
  ```
  We want to run a geometrical relaxation.
  Choose pseudopotentials
  Find the cutoff based on...TE or atomic forces
  Geometry optimize
  Plot H+L

# Design a crystal from scratch
In this tutorial we will create and optimize a crystal structure for a known material, wurtzite GaAs. This is a cell with hexagonal symmetry.

  1. Look up the space group for the wurtzite crystal. According to Wikipedia, it is https://en.wikipedia.org/wiki/Wurtzite_crystal_structure is it No. 186 or P6_3mc.
  2. The easiest way to create an initial structure is by searching a materials database such as https://materialsproject.org. After registering, search the database for GaAs, and find the entry that corresponds to this space group: it should have the index mp-8883.
    https://materialsproject.org/materials/mp-8883/
  3. Browse the page and confirm this is what you are looking for. Download the geometry in the CIF format, e.g. in the conventional cell.
  4. At this point you can construct the PWscf input using the data in the CIF file:
     ```
     ibrav=4
     A=4.05346620
     C=6.67955800
    ATOMIC {crystal} 
  Ga 0.66666667  0.33333333  0.49998900  
  Ga 0.33333333  0.66666667  0.99998900  
  As 0.66666667  0.33333333  0.87401100  
  As 0.33333333  0.66666667  0.37401100  

  5. Alternatively you can take the lazy option of using an input file generator at 
    https://www.materialscloud.org/work/tools/qeinputgenerator

  
### When you have completed this tutorial, you can move on to [1_variable_cell: Variable cell optimization](../1_variable_cell)
