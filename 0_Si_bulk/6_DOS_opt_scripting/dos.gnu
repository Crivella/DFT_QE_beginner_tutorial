#!/usr/bin/gnuplot

set term wxt enhanced
set key outside

plot 	'kpt_5/Si.dos.dat'  u 1:2 w l lw 2              lc rgb "black" title "kpt5" , 	'kpt_10/Si.dos.dat' u 1:2 w l lw 2 dt(10,5)     lc rgb "red"   title "kpt10", 	'kpt_15/Si.dos.dat' u 1:2 w l lw 2 dt(20,5)     lc rgb "blue"  title "kpt15", 	'kpt_20/Si.dos.dat' u 1:2 w l lw 2 dt(15,5,5,5) lc rgb "green" title "kpt20", 
pause -1
set term pdfcairo enhanced
set output "DOS_convergence.pdf"
replot
