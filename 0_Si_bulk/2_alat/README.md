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
      % grep -e '!' *out*alat*
      si.scf.out_alat10.00:!    total energy              =     -15.84397990 Ry
      [...]
      ```
  3. Save the lattice parameters and total energies in a 2 column file (alat,Etot) called 'Etot_vs_alat.dat' and plot it to estimate the lattice parameter corresponding to the minimum energy.
     ```
     gnuplot> plot "Etot_vs_alat.dat" w lp  
     ```
  4. In principle you could use a finer grid to find a precise value of alat, but this may not yield the right value for various reasons. It is better to determine alat by fitting to an equation of state such as the third-order Birch-Murnaghan equation:
     ![Third-order Birch–Murnaghan isothermal equation of state](Ref/birch.png?raw=true "Birch-Murnaghan EOS")
     You can use the quantum-ESPRESSO tool `ev.x` to fit with this EOS by selecting "birch2":
     ```
     % ev.x
        Lattice parameter or Volume are in (au, Ang) > au
        Enter type of bravais lattice (fcc, bcc, sc, noncubic) > fcc
        Enter type of equation of state :
        1=birch1, 2=birch2, 3=keane, 4=murnaghan > 2
        Input file > Etot_vs_alat.dat
        Output file > Etot_vs_alat-birch2.dat
     % cat Etot_vs_alat-birch2.dat
     # equation of state: birch 3rd order.  chisq =   0.3538D-09
     # a0 = 10.2108 a.u., k0 =  948 kbar, dk0 =  5.53 d2k0 = -0.036 emin =  -15.84756
     # a0 =  5.40333 Ang, k0 =  94.9 GPa,  V0 =   266.15 (a.u.)^3,  V0 =   39.44 A^3 
     [...]
     ```
     which shows the correct alat is 10.211 bohr. To obtain a reasonable value of the lattice constant, you should compute Etot over a range of about 5-10% above and below the minimum.
  5. Alternatively you can use the 'DoFit.gnu' gnuplot script to do the curve fitting and plot the resulting fits. It works only for FCC lattice and expects to read a file called 'Etot_vs_alat.dat'. The result of the fitting procedure is displayed on-screen (Lattice constant = 10.211 au) and the curves are plotted in the file 'murnaghan_fit.pdf'
     ```
     % gnuplot DoFit.gnu
     ```
     ![Murnaghan and parabolic fits](Ref/murnagan_fit.png?raw=true "Murnaghan fits")
     In contrast to a simple parabolic fit, the Murnaghan EOS fits perfectly to the computed data.
  6. ADVANCED: Use the scripts 'run_alat' and 'run_plots' in the 'Scripts' folder which will do steps 1-3 automatically. 
     ```
     % ./Scripts/run_alat
     % ./Scripts/run_plots
     ```
     Note that the file generated in this way is called 'Etot_vs_alat-script.dat'.
     Do not use the scripts for your own projects unless you understand well how they work!
  7. ADVANCED: An alternative method to find the lattice parameters is to use the 'vc-relax' option within quantum-ESPRESSO. By reading the [INPUT_PW documentation](https://www.quantum-espresso.org/Doc/INPUT_PW.html), modify the 'si.scf.in' file for a vc-relax run, and compare the result you get for alat with the above methods.

### When you have completed this tutorial, you can move on to [2_charge: Computing the charge density](../3_charge)
