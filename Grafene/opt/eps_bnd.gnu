#!/usr/bin/gnuplot

set term wxt enhanced

plot 	'bnd_5_0.1_epsTOT.dat'  u 1:2 w l lw 2              lc rgb "black" title "bnd5" , 	'bnd_10_0.1_epsTOT.dat' u 1:2 w l lw 2 dt(10,5)     lc rgb "red"   title "bnd10", 	'bnd_15_0.1_epsTOT.dat' u 1:2 w l lw 2 dt(20,5)     lc rgb "blue"  title "bnd15", 	'kpt_21_0.1_epsTOT.dat' u 1:2 w l lw 2 dt(15,5,5,5) lc rgb "green" title "bnd20", 
pause -1
set term pdfcairo enhanced
set output "eps_bnd_convergence.pdf"
replot
