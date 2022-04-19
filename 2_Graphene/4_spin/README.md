# Spin polarization in graphene nanoribbons.
In this tutorial we will use a quasi-1D strip or nanoribbon of graphene to show some spin-related properties.
To keep the calculations feasible, a small supercell is used. In principle, sufficient vacuum should surround the periodic ribbon in all directions perpendicular to the ribbon (x) axis.


##  UNDER CONSTRUCTION
To keep things simple, we will plot the band structure using the eigenvalues from the SCF run.

  1. Run the calculations for metal, spin, and spin-AFM.

    ```
    pw.x < GNR-metal.scf.in > GNR-metal.scf.out
    bands.x < GNR-metal.bandspp.in > GNR-metal.bandspp.out
    pp.x < GNR-metal.pp.in > GNR-metal.pp.out
    gnuplot> plot "GNR-metal-bands.dat.gnu" w lp
    ```
    ![Dependence of electrostatic potential on cell size](Ref/Vacuum.png?raw=true "Potential vs cell size")

