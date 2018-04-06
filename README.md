# DFT_esercitazioni
Esercitazioni DFT con quantum espresso

The package contains tutorials and exercises on how to perform Density Functional Theory calculations using the open-source package Quantum Espresso(QE) [1-3]

To running the exercies the following packages are required:
- A working version of QE needs to be installed/compiled and the executables needs to be located in the PATH environmental variable or specified manually in the variable BIN_DIR.
- A working version of gnuplot (>=5.0) (The exercies script will generate gnuplot file to plot the results. Other programs can also be used)
- A working version of xcrysden, a program that can visualize input and output files of QE.


Installing/Compiling QE:
- QE can be installed from repository for debian based linux distros (e.g.: Ubuntu) by running the command "sudo apt-get install quantum-espresso"
- QE can be compiled from source by:
   1) Download the desired release version from the GitHub page "https://github.com/QEF/q-e/releases". 
   2) Unzip/tar the downloaded package and go inside the folder.
   3) From terminal run the commands "./configure --prefix=path for installation", "make all" and "make install"
   NOTES: options for the configuration / use of external libraries for optimized executables is beyond the purpose of this tutorial.


The following exercises are included in this tutorial:
- Bulk silicon (0_Si_bulk)
   The purpouse of thise exercise is to show how to:
    1) Construct an input file for a choosen system and visualize it using xcrysden 
    2) Run a simple self-consistent calculation using pw.x
    3) Estimate the kinetic cutoff convergency
    4) Determine the theoretical lattice parameter
    5) Generate a high-symmetry k-path using xcrysden and calculate a band structure
    6) Calculate the density of states(DOS) and optical properties(independent particle approximation) and show the convergence over the number of k_points and empty bands used
- Two-dimensional boron nitride (1_BN)
   The purpouse of thise exercise is to show how to:
    1) How to use a supercell in order to run calculation for material that are not periodic in all directions.
- Graphene (2_Graphene)
   The purpouse of thise exercise is to show how to:
    1) Run calculation for a metallic/semimetallic system
    2) Calculate the charge density for a specific state and display it using xcrysden
- Carbon monoxide (2_CO)
   The purpouse of thise exercise is to show how to:
    1) Run a relax calculation and visualize the output using xcrysden
    2) Run a calculaiton for a molecule



[1] - https://www.quantum-espresso.org/
[2] - P. Giannozzi, S. Baroni, N. Bonini, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, G. L. Chiarotti, M. Cococcioni, I. Dabo, et al., Journal of physics: Condensed matter 21, 395502 (2009).
[3] - P. Giannozzi, O. Andreussi, T. Brumme, O. Bunau, M. B. Nardelli, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, M. Cococcioni, et al., Journal of Physics: Condensed Matter 29, 465901 (2017).

