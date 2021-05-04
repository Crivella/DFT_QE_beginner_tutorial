# Relax

In this part we are going to see how to relax the structure of the 1D system Ge<sub>5</sub>H<sub>12</sub> cluster. 

## Running

 1. Move into the `Ge_cluster/Relax` directory
 2. Open the `Ge5H12.relax.in` input file and check the differences with the `Ge5H12.scf.in` input file
 3. Run the relax calculation with the `pw.x` code typing in your terminal: 

    ```
    % pw.x < Ge5H12.relax.in > Ge5H12.relax.out
    ```
 4. Open the output file with your editor and check the outcome of the calculation
 5. Open the output with XCrySden typing:
     ```
    % xcrysden --pwo Ge5H12.relax.out
    ```