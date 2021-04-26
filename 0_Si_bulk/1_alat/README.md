# Theoretical lattice parameter
The lattice parameter of our theoretical system is usually not the same as the experimental one.
We can use the experimental value as an initial guess (or atomic bond lengths if the experiment is not available).
We then need to minimize the total energy with respect to a range of lattice parameters.
  1. Run the self-consistent calculation while varying the lattice parameter celldm(1) (=alat) from 10.00 to 10.35 bohr in steps of 0.05. Use your favourite editor to change `celldm(1) = 10.26,` to `celldm(1) = 10.00,` and run:
      ```
      % pw.x < si.scf.in > si.scf.out_alat10.00
      [...]
      % pw.x < si.scf.in > si.scf.out_alat10.35
      ```
      You could instead use `sed` directly as before
      ```
      % sed -e 's/celldm(1) = 10.26,/celldm(1) = 10.00,/' si.scf.in > si.scf.in_alat10.00
      % grep celldm si.scf.in_alat10.00
      % pw.x < si.scf.in_alat10.00 > si.scf.out_alat10.00
      ```
  2. Use grep to collect the total energies from all files in one command
      ```
      grep -e '!' *out*alat*
      ```
  3. Save the lattice parameters and total energies in a 2 column file (alat,Etot) called 'Etot_vs_alat.dat' and plot it to estimate the lattice parameter corresponding to the minimum energy.
     ```
     gnuplot> plot "Etot_vs_alat.dat" w lp  
     ```
  4. In principle you could use a finer grid to find a precise value of alat, but this may not yield the right value for various reasons. It is better to determine alat by fitting to an equation of state such as the Murnaghan equation:
     ![Third-order Birch–Murnaghan isothermal equation of state](Ref/birch.png?raw=true "Birch-Murnaghan EOS")
     You can use the quantum-ESPRESSO tool `ev.x` to fit with the Birch-Murnaghan (Birch2) EOS:
     ```
     % ev.x
        Lattice parameter or Volume are in (au, Ang) > au
        Enter type of bravais lattice (fcc, bcc, sc, noncubic) > fcc
        Enter type of equation of state :
        1=birch1, 2=birch2, 3=keane, 4=murnaghan > 2
        Input file > E_vs_cell.dat
        Output file > E_vs_cell-birch2.dat
     % cat E_vs_cell-birch2.dat
     # equation of state: birch 3rd order.  chisq =   0.3538D-09
     # a0 = 10.2108 a.u., k0 =  948 kbar, dk0 =  5.53 d2k0 = -0.036 emin =  -15.84756
     # a0 =  5.40333 Ang, k0 =  94.9 GPa,  V0 =   266.15 (a.u.)^3,  V0 =   39.44 A^3 
     [...]
     ```
     which shows the correct alat is 10.21 bohr. To obtain a reasonable value of the lattice constant, you should compute Etot over a range of about 5-10% above and below the minimum.
  5. Alternatively you can use the 'DoFit.gnu' gnuplot script to do the curve fitting and plot the resulting fits (works only for FCC lattice). The result of the fit is displated on-screen and the curves are plotted in the file 'murnaghan_fit.pdf'
     ```
     % gnuplot DoFit.gnu
     ```
     ![Murnaghan and parabolic fits](Ref/murnagan_fit.png?raw=true "Murnaghan fits")
  6. ADVANCED: Use the scripts 'run_alat' and 'run_plots' which will do all the above steps automatically.
  7. ADVANCED: An alternative method is to use the 'vc-relax' option within quantum-ESPRESSO. By reading the INPUT_PW file, modify the si.scf.in file for a vc-relax run, and compare the result you get for alat with the above methods.


