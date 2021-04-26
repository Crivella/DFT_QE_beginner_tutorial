# Electronic charge density
This exercise demonstrates the post-processing of data from a previous self-consistent result.
We will write the charge density in an '.xsf' file and visualize it using `XCrySDen`. 
We adopt the kinetic energy cutoff, k-point mesh, and lattice parameter determined in the previous steps.
  1. Run the self consistent calculation using the provided input file 'si.scf.in'
      ```
      % pw.x < si.scf.in > si.scf.out
      ```
  2. Run the post processing code `pp.x` using the provided input 'charge.in'
      ```
      % pp.x < charge.in > charge.out
      ```
     A description of the input files for the pp.x code can be found at [Link](http://https://www.quantum-espresso.org/Doc/INPUT_PP.html) or by opening the file PP/Docs/INPUT_PP.html in QE's source folder
  3. Plot the output file 'charge.xsf' using XCrySDen
      ```
      xcrysden --xsf charge.xsf
      ```
  4. Open the menu: Tools -> Data Grid and select 'ok'
  5. Input an 'isovalue' of about 1/10th of the 'maximum grid value' and click 'submit'. What are you looking at?
     (If you use a laptop with a small monitor: xcrysden has some bugs and the 'submit' buttom could be out of your monitor size.
      Try clicking on 'Plane #1' which should make the 'submit' button visible)
     ![charge density](Ref/charge1.png?raw=true "charge density")
  6. Now try a much higher value, 90-95% near the maximum. What are you looking at now?
     ![charge density](Ref/charge2.png?raw=true "charge density")
  7. ADVANCED: The pp.x tool can plot a lot of useful data. Modify 'charge.in' to plot the 'Electron Localization Function' for bulk silicon. Note the isovalue for ELF is defined between 0 and 1. Have a look at [1] to understand the results.

## Bibliography
1. Koumpouras and Andreas Larsson, J. Phys.: Condens. Matter 32 (2020) 315502 (12pp) [Link](https://doi.org/10.1088/1361-648X/ab7fd8)
Distinguishing between chemical bonding and physical binding using electron localization function (ELF)
