# Density of states(DOS) and dielectric function
The DOS and optical properties are 2 example of integrated quantities that depends on the wave function psi_n,k for all n and k.
Obviously, for implementation on a computer, the problems needs to be discretized and limited to a range.
This transaltes into the needs for convegency test for these imposed limits (number of bands and k-points).

  - The DOS is calculated using 'dos.x'
  - The optical properties for light polarized along x/y/z direction are calculated using 'pw2gw.x' in single-particle approximation
  - The details on how to run the exercise and the reated theory can be found in the 'Docs/DOS+opt.pdf' file
  - The details on the input file for the post-processing executable 'dos.x' and 'pw2gw.x' can be found in QE's source folder
    'PP/Doc/INPUT_DOS.html' and 'PP/Doc/INPUT_pw2gw.html' (only for version >=6.2)
