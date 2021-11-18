# Silicon bulk (0_Si_bulk)
Example on how to run basic DFT calculations on a well known system: bulk silicon 

## Running the exercise
  Enter each sub-directory in numerical order, and follow the detailed instructions in each README file.
  - [0_cutoff](0_cutoff)
    - View an input file for a simple crystal and visualize it using xcrysden. 
    - Run a simple self-consistent calculation using pw.x
    - Determine the convergence with respect to the kinetic energy cutoff
  - [1_alat](1_alat)
    - Determine the theoretical lattice parameter
  - [2_kpoints](2_kpoints)
    - Determine the convergence with respect to the k-point mesh
  - [3_charge](3_charge)
    - Calculate a charge density and visualize it using XCrySDen
  - [4_bandstructure](4_bandstructure)
    - Calculate a band structure using a non-self-consistent calculation
  - [6_DOS_opt_scripting](6_DOS_opt_scripting)
    - Calculate the density of states(DOS) and optical properties (independent particle approximation) and show the convergence over the number of k_points and empty bands used

## Documentation
  1. Follow the detailed instructions in the README files
  2. Look at the input file '0_Si_bulk/0_cutoff/si.scf.in'.
     The comments denoted by ! explain the input cards used which are found in almost any pw.x input
  3. Input files for quantum-ESPRESSO are described in 
     - [INPUT_PW](http://https://www.quantum-espresso.org/Doc/INPUT_PW.html) 
     - [INPUT_PP](http://https://www.quantum-espresso.org/Doc/INPUT_PP.html) 
     - [INPUT_BANDS](http://https://www.quantum-espresso.org/Doc/INPUT_BANDS.html) 
     - [INPUT_PROJWFC](http://https://www.quantum-espresso.org/Doc/INPUT_PROJWFC.html)
     - [everything else](https://www.quantum-espresso.org/resources/users-manual/input-data-description)

  4. Look at the files Docs/*.pdf for some more descriptive slides.

      
        
        
