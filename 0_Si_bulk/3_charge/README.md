# Electron charge density
These excercise is an example of post-processing run using a previous self-consistent result.
We will plot the charge density into a .xsf file and visualize it using XCrySDen
  1. Run the self consistent calculation using the provided input file 'si.scf.in'
      ```
      pw.x < si.scf.in > si.scf.out
      ```
  2. Run the post processing calculation pp.x using the provided input 'charge.in'
      ```
      pp.x < charge.in > charge.out
      ```
     A desription for the input files can be found on [Link](http://web.mit.edu/espresso_v6.1/i386_linux26/qe-6.1/Doc/INPUT_PP.html) or by opening the file PP/Docs/INPUT_PP.html in QE's source folder
  3. Open the output file 'charge.xsf' using XCrySDen
      ```
      xcrysden --xsf charge.xsf
      ```
  4. Open the menu Tools -> Data Grid and select ok
  5. Write an 'isovalue' ~1/10th of the 'maximum grid value' and click 'submit'
     (Warning if you use a laptot with a small monitor: xcrysden has some bugs and the 'submit' buttom could be out of your monitor size.
      I suggest to click on 'Plane #1' which should make the 'submit' button visible)
