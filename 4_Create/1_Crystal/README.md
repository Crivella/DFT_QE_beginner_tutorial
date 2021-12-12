# Design a crystal from scratch
In this tutorial we will create and optimize a crystal structure for a known material, wurtzite GaAs. This is a cell with hexagonal symmetry, as distinct from the diamond-like zinc blende phase.
![Wurtzite structure](Ref/GaAs_structures.png?raw=true "GaAs")

  1. Look up online the space group for the wurtzite crystal. According to Wikipedia https://en.wikipedia.org/wiki/Wurtzite_crystal_structure it is No. 186 or P6_3mc.
  2. The easiest way to create an initial structure is by searching a materials database such as https://materialsproject.org. 
     After registering, search the database for GaAs, and find the entry that corresponds to this space group: it should have the index mp-8883. You might be able to find the link directly by searching e.g. "https://materialsproject.org GaAs wurtzite". The direct link is in fact: https://materialsproject.org/materials/mp-8883/
  3. Browse the page and confirm this is what you are looking for. Download the geometry in the CIF format, e.g. in the conventional cell.
  4. METHOD 1: At this point you can construct the PWscf input using the data in the CIF file:
     ```
     ibrav=4
     A=4.05346620
     C=6.67955800
     ATOMIC_POSITIONS {crystal} 
     Ga 0.66666667  0.33333333  0.49998900  
     Ga 0.33333333  0.66666667  0.99998900  
     As 0.66666667  0.33333333  0.87401100  
     As 0.33333333  0.66666667  0.37401100  
     ```
     Modify a pre-existing file, e.g.
     ```
     % ../../0_Si_bulk/3_charge/si.scf.in gaas.in
     ``` 
     making sure to modify the number of atoms, types, symmetry, etc. When you are ready, check it with xcrysden:
     ```
     % xcrysden --pwi gaas.in
     ```
  5. Choose appropriate pseudopotentials from the quantum-ESPRESSO site. For simplicity, let's use the pseudo-DOJO again, LDA flavour. How many filled states do we expect?
     ```
     % grep z_valence *.upf
     As.upf:z_valence="   15.00"
     Ga.upf:z_valence="   13.00"
     ```

  6. METHOD 2: Alternatively you can take the lazy option of using an input file generator at https://www.materialscloud.org/work/tools/qeinputgenerator
     or use some conversion tools like cif2cell https://sourceforge.net/projects/cif2cell/

  7. Carry out a test calculation using a reasonable guess for the cutoff and k-point set, setting the number of bands in order to report the gap at the Gamma point. Use a small smearing. Is the gap large or small? 

     Indeed, the small gap in GaAs with LDA/GGA makes calculations quite difficult to carry out. One must take much care with k-point sampling and convergence tests in general, as well as in choice of pseudopotentials.

  8. Compute the band structure of wurtzite GaAs along a suitable path. Use either the Xcrysden k-path tool or the materials cloud seekpath tool: https://www.materialscloud.org/work/tools/seekpath 

![GaAs bands](Ref/GaAs_bands.jpeg?raw=true "GaAs bands")
![GaAs bands](Ref/GaAs_by_hand_bands.png?raw=true "GaAs bands")

  9. Carry out convergence tests on cutoff and k-points.

 10. ADVANCED: Optimize the two lattice constants (a,c) of WZ GaAs using (1) vc-relax and (2) using a shell script.

 11. ADVANCED: Repeat the exercise for zinc-blende (ZB) GaAs.

 12. ADVANCED: Using fully relativistic pseudopotentials, compute the spin-orbit split-off energy for ZB GaAs.
![GaAs SOC](Ref/GaAs_SOC.png?raw=true "GaAs SOC")

### Various material science databases:
  - https://materialsproject.org
  - http://oqmd.org/
  - https://www.materialscloud.org/
  - https://nomad-lab.eu/
  - http://aflowlib.org/
  - https://jarvis.nist.gov/
  - https://materials.nrel.gov/
  - http://www.2dmatpedia.org/
  - https://omdb.mathub.io/
  See https://www.nature.com/articles/s43588-020-00016-5 for a nice discussion of their use.
