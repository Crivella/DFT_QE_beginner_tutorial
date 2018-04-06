# DFT_esercitazioni
Esercitazioni DFT con quantum espresso

The package contains tutorials and exercises on how to perform Density Functional Theory calculations using the open-source package Quantum Espresso(QE) [1-3]

To running the exercies the following is required:
 - A working version of QE needs to be installed/compiled and the executables needs to be located in the PATH environmental variable or specified manually in the variable BIN_DIR.


- Installing/Compiling QE:
- QE can be installed from repository for debian based linux distros (e.g.: Ubuntu) by running the command "sudo apt-get install quantum-espresso"
-- QE can be compiled from source by:
1) Download the desired release version from the GitHub page "https://github.com/QEF/q-e/releases". 
2) Unzip/tar the downloaded package and go inside the folder.
3) From terminal run the commands "./configure --prefix=path for installation", "make all" and "make install"
NOTES: options for the configuration / use of external libraries for optimized executables is beyond the purpose of this tutorial


[1] - https://www.quantum-espresso.org/
[2] - P. Giannozzi, S. Baroni, N. Bonini, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, G. L. Chiarotti, M. Cococcioni, I. Dabo, et al., Journal of physics: Condensed matter 21, 395502 (2009).
[3] - P. Giannozzi, O. Andreussi, T. Brumme, O. Bunau, M. B. Nardelli, M. Calandra, R. Car, C. Cavazzoni, D. Ceresoli, M. Cococcioni, et al., Journal of Physics: Condensed Matter 29, 465901 (2017).

