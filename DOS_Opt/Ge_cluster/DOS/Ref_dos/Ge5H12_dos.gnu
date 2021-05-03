#plot Ge5H12_DOS

set title 'Ge_{5}H_{12} DOS' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel 'DOS' font ',14'
set key font ',14'
set xtics font ',12'
set ytics font ',12'
plot 'Ge5H12.dos.dat' u 1:2 t 'bnd5' w l lw 3 lc rgb 'black' 

