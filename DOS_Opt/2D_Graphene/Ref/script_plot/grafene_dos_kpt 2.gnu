#plot Grafene_dos

set title 'Grafene DOS' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel 'DOS' font ',14'
set key font ',14'
set xtics font ',12'
set ytics font ',12'
plot '../kpt15/Grafene.dos.dat' u 1:2 t 'kpt15' w l dashtype 2 , '../kpt21/Grafene.dos.dat' u 1:2 w l lw 2 lc rgb 'red' t 'kpt21' , '../kpt30/Grafene.dos.dat' u 1:2 w l lw 2 lc rgb 'black' t 'kpt30' 

