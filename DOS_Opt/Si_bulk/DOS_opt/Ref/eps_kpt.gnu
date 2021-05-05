set title 'Bulk Silicon' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel '{/Symbol e}_2' font ',14'
set key font ',14'
set xtics font ',12'
set ytics font ',12'
plot 'kpt5/epsTOT.dat' u 1:2 t 'kpt5' w l dashtype 2 , 'kpt10/epsTOT.dat' u 1:2 w l lw 2 lc rgb 'red' t 'kpt10' , 'kpt20/epsTOT.dat' u 1:2 w l lw 2 lc rgb 'black' t 'kpt20'
