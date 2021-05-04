#plot Ge5H12_eps

set title 'Ge_{5}H_{12} {/Symbol e}_2' font ',18'
set xlabel 'E [eV]' font ',14'
set ylabel '{/Symbol e}_2' font ',14'
set key font ',14'
set xtics font ',12'
set ytics font ',12'
unset key
plot 'epsTOT.dat' u 1:2 w l lw 3 lc rgb 'black'

