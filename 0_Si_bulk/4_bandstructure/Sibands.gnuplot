set title "Si band structure from Sibands.dat.gnu"
#high-symmetry point:  0.5000 0.5000 0.5000   x coordinate   0.0000
#high-symmetry point:  0.0000 0.0000 0.0000   x coordinate   0.8660
#high-symmetry point:  0.0000 1.0000 0.0000   x coordinate   1.8660
#high-symmetry point:  0.2500 1.0000 0.2500   x coordinate   2.2196
#high-symmetry point:  0.7500 0.7500 0.0000   x coordinate   2.2196
#high-symmetry point:  0.0000 0.0000 0.0000   x coordinate   3.2802
L=0.0000
G1=0.8660
X=1.8660
U=2.2196
G2=3.2802
set xtics ("L" L,"{/Symbol G}" G1,"X" X,"U,K" U,"{/Symbol G}" G2) nomirror
set xrange [*:*]
set yrange [-13:4]
set grid x
set ylabel "Energy (eV)"
set nokey
EF = 6.377
set term post enhanced
set out "Sibands-nosym.ps"
plot "Sibands.dat.gnu" u 1:($2-EF) with linespoints pointtype 7 pointsize 0.5,\
	0 t "" w l lt 2
set term pngcairo
set out "Sibands-nosym.png"
replot
set term dumb size 120,40
set out 
replot
set term x11
set out
replot
