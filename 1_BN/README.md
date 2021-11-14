# Two-dimensional boron nitride (1_BN)
Here we will learn how to run a calculation for a material that is not periodic in all dimensions.
The system will still be calculated using the periodic boundary condition.
The trick is to put enough vacuum between the 2D layer and the cell border, 
so that the repeating layers are far enough apart that they do not interact.

## Purpose
  1. Calculate a non fully periodic material using a supercell.
  2. Compute an observable quantity like the ionization energy or work function.
  3. Test the convergence with respect to cell/vacuum size.

## Running the exercise
  1. Run the exercises in the folder [0_test_vacuum](0_test_vacuum).
