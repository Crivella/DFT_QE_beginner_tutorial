#!/usr/bin/gnuplot

set term wxt enhanced

set xlabel "ecut (Ry)"
set ylabel "E_{tot} (Ry)"

plot 	'E_vs_ecut.dat'  u 1:2 w lp pt 7 lw 2  lc rgb "black" title "E vs alat" 

pause -1
set term pdfcairo enhanced
set output "E_vs_ecut.pdf"
replot
