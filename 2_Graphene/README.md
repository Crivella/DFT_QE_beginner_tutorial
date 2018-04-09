# Graphene (2_Graphene)
Example on how to run calculation for a metallic/semi-metallic system.
In the previous exercises the systems manifested a band-gap.
In the case of a metal/semi-metal, the bands cross the Fermi level which causes problem for the routines if we work with a step-like distribution (Fermi-Dirac at 0K).
A smearing(temperature) needs to be introduced using the input cards 'occupation='smearing', 'degauss=...[Ry]' and 'smearing=gaussian/...'.
Look at the input file description for all the possible types of smearing.
Another problem arise for quantities that are results of integration over the entire BZ. 
As it is hinted in 'Docs/DOS+OPT.pdf' integrated properties for metals/semi-metals requires extremely dense k-point meshes to converge.

## Purpose
1. Run calculation for a metallic/semimetallic system

## Running the exercise
1. Run the exercise from the folders following the numeric order
