#!/usr/bin/gnuplot

set term wxt enhanced

set xlabel "Cell size (bohr)"
set ylabel "Bond lenght (bohr)"

plot 	'bondl_vs_size.dat'  u 1:2 w lp pt 7 lw 2  lc rgb "black" title "bondl vs size" 

pause -1
set term pdfcairo enhanced
set output "bondl_vs_size.pdf"
replot
