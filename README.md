# DFT Tutorial 
Beginner tutorial for Density Functional Theory (DFT) calculations using [Quantum Espresso](https://www.quantum-espresso.org/)(QE)[1,2]. 

## Required packages
* A working version of QE (>=6.4) needs to be installed/compiled and the executables needs to be located in the PATH environmental variable or specified manually in the variable BIN_DIR.
* A working version of gnuplot (>=5.0) (Some scripts will generate gnuplot files to plot the results. Other programs can also be used)
* A working version of XCrySDen (http://www.xcrysden.org/), a program that can visualize input and output files of QE.

## Installing/Compiling QE
* QE can be installed from repository for Debian based linux distros (e.g.: Ubuntu) by running the command
    ```
    % sudo apt-get install quantum-espresso
    ```
    PS: The latest available version is shown at: https://packages.ubuntu.com/groovy/quantum-espresso (>6.5-1)

* QE can be compiled from source:
 1. Download the desired release version from the GitHub page "https://github.com/QEF/q-e/releases". 
 2. Unzip/tar the downloaded package and go inside the folder.
 3. From terminal run the commands

     ```
     % ./configure --prefix=path for installation
     % make all
     % make install
     ```

  NOTE: options for the configuration / use of external libraries for optimized executables is beyond the purpose of this tutorial.


## Overview of exercises 
### [Bulk silicon](0_Si_bulk)
  1. View an input file for a simple crystal and visualize it using xcrysden 
  2. Run a simple self-consistent calculation using pw.x
  3. Determine the convergence with respect to the kinetic energy cutoff and k-point mesh 
  4. Determine the theoretical lattice parameter
  5. Calculate a charge density and visualize it using XCrySDen
  6. Generate a high-symmetry k-path using xcrysden and calculate a band structure using a non-self-consistent calculation
  7. Calculate the density of states(DOS) and optical properties(independent particle approximation) and show the convergence over the number of k_points and empty bands used
### Two-dimensional boron nitride (1_BN)
  1. How to use a supercell in order to run calculation for material that are not periodic in all directions.
### Graphene (2_Graphene)
  1. Run calculation for a metallic/semimetallic system
### Carbon monoxide (3_CO)
  1. Run a relax calculation and visualize the output using xcrysden
  2. Run a calculaiton for a molecule (0D system)
  3. Calculate the binding energy of a molecule
  4. Visualize the HOMO and LUMO of a molecule (charge density for specific k-point and band)
  5. Use a Lennard-Jones like potential to fit the data 'E_tot' vs 'bond lenght'
  
## Other folders
* Docs: Contain additional tutorials in pdf format
* Codes: Contain user-made code to analyze some of the data produced by QE
  1. boad.c (by Davide Grassano aka Crivella): Apply a gaussian broadening(to the *y_n* data) to a multicolumn file where the *1st* column represents the x data and the *2nd,3rd,...* columns represent the *y_1, y_2, ...* data.
  2. plot_pwbands.f90 (by ...) : ...
* Pseudo: Contain the pseudopotential required to perform the exercises


## Bibliography
1. P. Giannozzi, S. Baroni, N. Bonini, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, G. L. Chiarotti, M. Cococcioni, I. Dabo, et al., Journal of physics: Condensed matter 21, 395502 (2009).
2. P. Giannozzi, O. Andreussi, T. Brumme, O. Bunau, M. B. Nardelli, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, M. Cococcioni, et al., Journal of Physics: Condensed Matter 29, 465901 (2017).
