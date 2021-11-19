# Projection onto atomic orbitals
Useful information about the local chemical environment can be obtained by projecting the wavefunctions onto atomic orbitals. 
To do this we use the code `projwfc.x`. This is quite a powerful routine, giving access to atomic projections, population analysis via Lowdin charges, and projected DOS.
As always, the documentation is found at https://www.quantum-espresso.org/Doc/INPUT_PROJWFC.html .

## Purpose
  1. Use projwfc.x to determine the chemical nature of the molecular states.

## Running the exercise
  1. Recompute the charge density of the CO molecule, and run the projections code:
      ```
      % pw.x < co.relax.in > co.relax.out
      % projwfc.x < co.projwfc.in > co.projwfc.out
      ```

  2. Now look at the output file. First there is a list of the atomic orbitals to be used in the projection. NB: to understand the meaning of m=1, m=5 etc, you should look at "Orbital order" on the INPUT_PROJWFC.html page; here the usual meanings px, py etc have been added.
      ```
      state #   1: atom   1 (C  ), wfc  1 (l=0 m= 1) s
      state #   2: atom   1 (C  ), wfc  2 (l=1 m= 1) pz
      state #   3: atom   1 (C  ), wfc  2 (l=1 m= 2) px
      state #   4: atom   1 (C  ), wfc  2 (l=1 m= 3) py

      state #  17: atom   2 (O  ), wfc  1 (l=0 m= 1) s
      state #  18: atom   2 (O  ), wfc  2 (l=1 m= 1) pz
      state #  19: atom   2 (O  ), wfc  2 (l=1 m= 2) px
      state #  20: atom   2 (O  ), wfc  2 (l=1 m= 3) py
      ```

     Further on, for every band and k-point each state is written as a sum over projections, using the indices in the atomic table above.

      ```
==== e(   5) =    -8.34315 eV ====
     psi = 0.540*[#   1]+0.345*[#   3]+0.074*[#  19]+ ...
    |psi|^2 = 0.989
==== e(   6) =    -1.30749 eV ====
     psi = 0.284*[#   2]+0.284*[#   4]+0.103*[#  18]+0.103*[#  20]+ ...
    |psi|^2 = 0.997
      ```
     Are the projections consistent with the HOMO and LUMO plotted in a previous step?

  3. Inspect the Lowdin charges:
     ```
     Atom #   1: total charge =   3.8895, s =  1.5375, 
     Atom #   1: total charge =   3.8895, p =  2.0608, pz=  0.5095, px=  1.0419, py=  0.5095, 
     Atom #   2: total charge =   6.0142, s =  1.4940, 
     Atom #   2: total charge =   6.0142, p =  4.3279, pz=  1.3448, px=  1.6382, py=  1.3448, 
     ```
     We know the valence charge of C(4) and O(6). Thus we can evaluate the partial electronic charges as: C(+0.11) O(-0.01), i.e. a transfer of electrons from the C to the O. This is consistent with the direction expected from the electronegativies, which are C(2.5) and O(3.5).

     Note however that Lowdin analysis is very approximate and can only give qualitiative indications of trends.

     ![HOMO and LUMO](Ref/psi2_all.png?raw=true "HOMO-LUMO vs cell size")
     
