# Dielectric Function and DOS

Dielectric function, as well as the DOS, is a quantity that requires the integration over the whole Brillouin zone. In general, in order to produce reliable data, a convergency test over the size of the k-point mesh needs to be run. Since the optical properties depends on both occupied and unoccupied states, another convergency test over the number of bands *nbnd* must be performed. In this section we will calculate the eps<sub>2</sub> and the DOS simultaneously.

## Steps

 1. Run a *scf* calculation to get a converged charge density
 2. Run a *nscf* calculation to get the eigenvalues od the system
 3. Compute the density of states
 4. Compute de matrix elements and the dielectric function  components 
 5. Plot the imaginary part of the dielectric function vs energy.

## Running

 1. Move into the `Grafene/Dos_opt` directory
 2. Run the *scf* calculation with the command to generate the charge density in the tmp directory:
    ```
    % pw.x < Grafene.scf.in > Grafene.scf.out
    ```
 3. Create the directory needed for the convergency on the k-point and the number of bands.
    ```
    % mkdir kpt15 kpt21 kpt30 bnd5 bnd10 bnd15
    ``` 
 4. Run the *scf* calculation to generate the charge density in the *tmp* directory:
    ```
    % pw.x < Grafene.scf.in > Grafene.scf.out
    ```  
 5. Now we have to copy the *tmp* folder in the directories previously created for the convergence. This is necessary to separate the calculation for each k-point and nbnd, avoiding confusion and issues in reading and writing the eigenvalues generated in the different nscf calculation that will be performed.
    ```
    % cp -r tmp kpt15
    % cp -r tmp kpt21
    % cp -r tmp kpt30
    % cp -r tmp bnd5
    % cp -r tmp bnd10
    % cp -r tmp bnd15
    ```   
 6. Move the different *nscf* input in the relative directories typing:
    ```
    % mv Grafene.kpt_15.nscf.in kpt15/
    % mv Grafene.kpt_21.nscf.in kpt21/
    % mv Grafene.kpt_30.nscf.in kpt30/
    % mv Grafene.bnd_5.nscf.in bnd5/
    % mv Grafene.bnd_10.nscf.in bnd10/
    % mv Grafene.bnd_15.nscf.in bnd15/
    ```
 7. We have to copy the Grafene.dos.in and Grafene.pw2gw.in files in the kptXX e bndYY directories. This is necessary to avoid overwriting of the files since the dos.x and pw2gw.x codes generate file with default name (e.g. `epsTOT.dat`). We have to do this with both the dos and pw2gw input files.
    ```
    % xargs -n 1 cp -v Grafene.dos.in<<<"kpt15/ kpt21/ kpt30/ bnd5/ bnd10/ bnd15/"
    % xargs -n 1 cp -v Grafene.pw2gw.in<<<"kpt15/ kpt21/ kpt30/ bnd5/ bnd10/ bnd15/"
    ```
 
 8. Once completed the organization of the input files in the relative folder we can start the calculations. Starting from the bnd5 folder we have to run in sequence the *nscf* , the dos and the pw2gw calculation, running the commands:
    ```
      % cd bnd5/
      % pw.x < Grafene.bnd_5.nscf.in > Grafene.bnd_5.nscf.out
      % dos.x < Grafene.dos.in > Grafene.dos.out
      % pw2gw.x < Grafene.pw2gw.in > Grafene.pw2gw.out
      % rm -r tmp
      % cd ../bnd10/
    ```
    And so on with the other directories.
 9. Now we can plot the calculated quantities checking the convergence for higher values of k-points grid and nbnd.
 10. To plot the DOS of graphene for different values of *nbnd*,  in *gnuplot* 
     ```
     gnuplot> plot  'bnd5/Grafene.dos.dat'  u  1:2  t  'bnd5'  w  l  dashtype  2 , 'bnd10/Grafene.dos.dat'  u  1:2  w  l lw 2  lc  rgb  'red'  t  'bnd10' , 'bnd15/Grafene.dos.dat'  u  1:2  w  l lw 2  lc  rgb  'black'  t  'bnd15'
     ```
  
 11. To plot the DOS of graphene for different values of *kpt*,  in *gnuplot* 

     ```    
     gnuplot> plot  'kpt15/Grafene.dos.dat'  u  1:2  t  'kpt15'  w  l  dashtype  2 , 'kpt21/Grafene.dos.dat'  u  1:2  w  l lw 2  lc  rgb  'red'  t  'kpt21' , 'kpt30/Grafene.dos.dat'  u  1:2  w  l lw 2  lc  rgb     'black'  t  'kpt30'     ```
 12.  To plot the  eps<sub>2</sub> of graphene for different values of *nbnd*,  in *gnuplot* :
         ```   
        gnuplot> plot  'bnd5/epsTOT.dat'  u  1:2  t  'bnd5'  w  l    dashtype  2 , 'bnd10/epsTOT.dat'  u  1:2  w  l lw 1  lc  rgb  'red'  t  'bnd10' , 'bnd15/epsTOT.dat'  u  1:2  w  l lw 2  lc  rgb  'blue'  t  'bnd15'
       ```  

 13. To plot the  eps<sub>2</sub> of graphene for different values of *kpt*,  in *gnuplot*
     ```   
     gnuplot> plot  'kpt15/epsTOT.dat'  u  1:2  t  'kpt15'  w  l  dashtype  2 , 'kpt21/epsTOT.dat'  u  1:2  w  l lw 1  lc  rgb  'red'  t  'kpt21' , 'kpt30/epsTOT.dat'  u  1:2  w  l lw 2  lc  rgb  'blue'  t  'kpt30' , 'epsTOT_396.dat'  u  1:2  w  l lw 3  lc  rgb  'black'  t'kpt396'
      ```  
