#plot Grafene_eps

set title 'Grafene {/Symbol e}_2' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel '{/Symbol e}_2' font ',14'
set key font ',14'
set yrange [0:15]
set xtics font ',12'
set ytics font ',12'
plot '../kpt15/epsTOT.dat' u 1:2 t 'kpt15' w l dashtype 2 , '../kpt21/epsTOT.dat' u 1:2 w l lw 1 lc rgb 'red' t 'kpt21' , '../kpt30/epsTOT.dat' u 1:2 w l lw 2 lc rgb 'blue' t 'kpt30' , 'epsTOT_396.dat' u 1:2 w l lw 3 lc rgb 'black' t'kpt396'

