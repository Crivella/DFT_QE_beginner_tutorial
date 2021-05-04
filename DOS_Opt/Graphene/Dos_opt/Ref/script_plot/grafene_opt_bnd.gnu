#plot Grafene_eps

set title 'Grafene {/Symbol e}_2' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel '{/Symbol e}_2' font ',14'
set key font ',14'
set yrange [0:6]
set xtics font ',12'
set ytics font ',12'
plot '../bnd5/epsTOT.dat' u 1:2 t 'bnd5' w l dashtype 2 , '../bnd10/epsTOT.dat' u 1:2 w l lw 1 lc rgb 'red' t 'bnd10' , '../bnd15/epsTOT.dat' u 1:2 w l lw 2 lc rgb 'blue' t 'bnd15' 

