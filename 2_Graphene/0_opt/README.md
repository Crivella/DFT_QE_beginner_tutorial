# Dielectric function
The dielectric function is calculated following the same procedure described in exercise 0.5

  - The optical properties for light polarized along x/y/z direction are calculated using 'pw2gw.x' in single-particle approximation
  - The details on how to run the exercise and the reated theory can be found in the 'Docs/DOS+opt.pdf' file
  - The details on the input file for the post-processing executable 'pw2gw.x' can be found in QE's source folder 'PP/Doc/INPUT_pw2gw.html' (only for version >=6.2)
  - The script 'run_opt' automate all the action required. 
    It shows also how to define/call a function in bash in a separate file(functions) to make the main script easier to read.
