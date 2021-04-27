#!/usr/bin/gnuplot

set term wxt enhanced

LIST="5 6 7 8 9 10 11 12 13 14 15"

set xlabel "Cell size (bohr)"
set ylabel "Potential (Ry)"

plot for[i=1:words(LIST)]	sprintf("co.avg.out_size%d",word(LIST,i)+0)  u 1:2 w l lw 2  title sprintf("size=%d",word(LIST,i)+0)

pause -1
set term pdfcairo enhanced
set output "vacuum.pdf"
replot
