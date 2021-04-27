# Carbon monoxide (2_CO)
This tutorial illustrates how to run a calculation for a zero-dimensional system (molecule/quantum-dot).  
Follow the exercises from the sub-folders in numerical order.

## Running the exercise
  Enter each sub-directory in numerical order, and follow the detailed instructions in each README file.
  - [0_cellsize](0_cellsize) 
    - Run a relax calculation for a molecule and visualize the output using xcrysden
    - Plot the electrostatic potential in the cell
    - Converge the bond length with the cell size
    - Test convergence of other properties with cell size
  - [1_relax](1_relax)
    - Converge the geometry with the kinetic energy cutoff
  - [2_binding](2_binding)
    - Compute the binding energy of the CO molecule
    - Understand how to treat orbital occupation correctly in the O atom
  - [3_homolumo](3_homolumo)
    - Visualize the HOMO and LUMO of the CO molecule 
    - Investigate the orbital character as a function of cell size
  - [4_LennardJones](4_LennardJones) Use a Lennard-Jones like potential to fit the Energy vs Bond length curves

