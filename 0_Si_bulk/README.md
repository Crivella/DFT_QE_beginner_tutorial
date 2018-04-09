# Silicon bulk (0_Si_bulk)
Example on how to run basic DFT calculation on a well known system such as Si

## Purpose
  1. Construct an input file for a choosen system and visualize it using xcrysden 
  2. Run a simple self-consistent calculation using pw.x
  3. Estimate the kinetic cutoff convergency
  4. Determine the theoretical lattice parameter
  5. Calculate a charge density and visualize it using XCrySDen
  6. Generate a high-symmetry k-path using xcrysden and calculate a band structure
  7. Calculate the density of states(DOS) and optical properties(independent particle approximation) and show the convergence over the number

## Running the exercise
  1. Look at the file Docs/DFT1.pdf for a detailed tutorial on 'pw.x' input files.
     The documentation for the input cards can be found
      - Online by searching for "pw.x input" ([Link](http://web.mit.edu/espresso_v6.1/i386_linux26/qe-6.1/Doc/INPUT_PW.html))
      - In the QE source folder by opening the file 'PW/Doc/INPUT_PW.html'
  2. Look at the input file '0_Si_bulk/0_cutoff/si.scf-manual.in'.
     The comments denoted by ! explain the input cards used which are found in almost any pw.x input
  3. Run the example in each sub-directory following the numeric ordering

      
        
        
