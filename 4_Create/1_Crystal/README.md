# UNDER CONSTRUCTION!!!

# Design a crystal from scratch
In this tutorial we will create and optimize a crystal structure for a known material, wurtzite GaAs. This is a cell with hexagonal symmetry, as distinct from the diamond-like rock-salt phase.

  1. Look up online the space group for the wurtzite crystal. According to Wikipedia https://en.wikipedia.org/wiki/Wurtzite_crystal_structure it is No. 186 or P6_3mc.
  2. The easiest way to create an initial structure is by searching a materials database such as https://materialsproject.org. 
     After registering, search the database for GaAs, and find the entry that corresponds to this space group: it should have the index mp-8883.
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
     or use some conversion tools like cif2cell https://sourceforge.net/projects/cif2cell/

  6. Choose a pseudopotential and carry out convergence tests on cutoff, k-points, alat, etc.
  
### When you have completed this tutorial, you can move on to [1_variable_cell: Variable cell optimization](../1_variable_cell)

https://www.nature.com/articles/s43588-020-00016-5
    - https://materialsproject.org
    - http://oqmd.org/
    - https://www.materialscloud.org/
    - https://nomad-lab.eu/
    - http://aflowlib.org/
    - https://jarvis.nist.gov/
    - https://materials.nrel.gov/
    - http://www.2dmatpedia.org/
    - https://omdb.mathub.io/
