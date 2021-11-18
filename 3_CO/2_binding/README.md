# Binding energy
The binding energy is defined as the energy required to bring the atoms of a molecule to infinite distance from each other (non-interacting).
It can be computed by calculation the total energy of the isolated atoms with respect to the total energy of the molecule.

# Purpose
  1. Calculate the binding energy of a molecule
  2. Run a spin polarized calculation
  - Here we have a problem!!! Oxygen is a paramagnetic atom where the electrons prefer to occupy states with parallel spin instead of filling up states with antiparallel configuration. 
    See the electron configuration.

    ![Hunds rule](Ref/hunds_rule.png?raw=true "Hunds rule")

  - In order to perform this calculation we set 'starting_magnetization=0.1' to a value different from 0.0 to tell QE to perform a spin-polarized calculation

# Running the exercise
  1. Run a self-conistent calculation for all the provided input files
      ```
      pw.x < INPUT > OUTPUT
      ```
  2. Write down the total energy of all the outputs
  3. Calculate the binding energy "CO_tot - (C_tot + O_tot)"
  4. Confront the obtained value withe the provided reference "3_CO/Ref/binding.dat"

# Script
Alternately just launch the script and learn nothing :)
     ```
     ./run_pp
     ```
Check the numbers in binding_energy.dat

# Try launching the scf calculation for o-nospin.scf.in, commenting out the occupations and degauss variables.
