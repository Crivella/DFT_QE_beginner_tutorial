# Test vacuum
We need a criteria to define the smallest amount of empty space/vacuum between systems in two adjacent supercells required in order form them to be considered as isolated systems. 
To do this we can calculate the potential along the z axis of our supercell. In the proximity of the atoms, V will present a deep. Moving away from the atoms and into the Vacuum region we will observe the potential going to a constant that defines the "vacuum level".
When this behavior is observed, we can say that the potential of one layer in a supercell does not interact with that of another, hence they are isolated.

  1. Run the calculation
    pw.x < BN.scf_cdm?.in > BN.scf_cdm?.out   ?=(1,2,3,4,5,6)

  2. Run the post-processing
    pp.x < pp.in
    average.x < average.in > avg_cdm?.dat

  3. Repeat step 1 and 2 with different celldm(3) and compare their results (change the name of the inputs/outputs)

