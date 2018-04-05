#!/usr/bin/gnuplot

set term wxt enhanced

plot 	'kpt_15_0.1_epsTOT.dat'  u 1:2 w l lw 2             lc rgb "black" title "kpt15" , 	'kpt_21_0.1_epsTOT.dat' u 1:2 w l lw 2 dt(10,5)     lc rgb "red"   title "kpt21", 	'kpt_30_0.1_epsTOT.dat' u 1:2 w l lw 2 dt(20,5)     lc rgb "blue"  title "kpt30", 
pause -1
set term pdfcairo enhanced
set output "eps_kpt_convergence.pdf"
replot
