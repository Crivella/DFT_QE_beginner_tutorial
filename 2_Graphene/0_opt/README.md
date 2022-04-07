# Dielectric function
The dielectric function is an example of integrated quantitie that depends on the wave function psi_n,k for all n and k.
Obviously, for implementation on a computer, the problems needs to be discretized and limited to a range.
This translates into the needs for convergence test for these imposed limits (number of bands and k-points).

  - The dielectric function for light polarized along x/y/z direction are calculated using 'pw2gw.x' in single-particle approximation
  - The details on the theory can be found in the 'Docs/DOS+opt.pdf' file
  - The details on the input file for the post-processing executable 'pw2gw.x' can be found in QE's source folder
    'PP/Doc/INPUT_pw2gw.html' (only for version >=6.2)
  - The script 'run_opt' automate all the action required. 
    It shows also how to define/call a function in bash in a separate file(functions) to make the main script easier to read.

  1. Run the scf calculation
      ```
      pw.x < Grafene.scf.in > Grafene.scf.out
      ```
  2. Make a backup of the generated tmp (we will need it later)
      ```
      cp -r tmp tmp_scf
      ```
  3. Run the non self consistent(nscf) calculation
      ```
      pw.x < Grafene.kpt_??.nscf.in > Grafene.kpt_??.nscf.out (??=15/21/30)
      ```
  4. Create a new folder and move the outputs into it. This step is needed because we will be using a different tmp for every calculation. Also the output of pw2gw all have the same names (epsX/Y/Z/TOT.dat and will be overwritten if ran in the same folder)
      ```
      mkdir kpt_??
      mv -t kpt_?? Grafene.kpt_??.nscf.out tmp
      ```
      The command 'mv -t' set a folder as a target and move everything that comes after into it
  5. Go inside the new folder and run the dos and optical calculations. We don't need to save their output since they don't contain any physically relevant information.
      ```
      cd kpt_??
      pw2gw.x < ../Grafene.pw2gw.in
      ```
  6. Go back to the previous folder and copy the backup tmp, than repeat steps 3-5 for all calculations with kpt and bnd in the filename (k-point and band convergence). We are copying the tmp folders so we have one for each calculation and we don't overwrite the wave-functions at every step (we could still use them for further post-processing!!!).
      ```
      cd ..
      cp -r tmp_sct tmp
      ```

  7. Apply a gaussian broadening to the optical properties outputs (epsX/Y/Z/TOT.dat)
      ```
      cd {MAIN_FOLDER}/Codes
      gcc -o broad.x broad.c -O2 -g -Wall -lm -std=c11
      ```
      Now you can decide to copy the broad.x in every folder or use a relative path to it. The following pieces of codes assumes that you followed this guide step-by-step, otherwise you will need to adjust the paths used for calling the broad.x code!!!
      ```
      cd Main_folder_for_optical_calculation
      ../../Codes/broad.x kpt_??/epsTOT.dat 0.1 kpt_??_0.1_epsTOT.dat (??=15/21/30)
      ../../Codes/broad.x bnd_??/epsTOT.dat 0.1 bnd_??_0.1_epsTOT.dat (??=5/10/15)
      ```
      If you are not comfortable with C code, the Codes folder also contains codes with the same functionalities written in Fortran and Python

  8. Plot the results using the provided scripts for gnuplot or your favorite plotting tool
      ```
      gnuplot eps_kpt.gnu
      gnuplot eps_bnd.gnu
      ```

