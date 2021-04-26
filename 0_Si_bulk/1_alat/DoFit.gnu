#!/usr/bin/gnuplot
# 
# Script di gnuplot per fare il fit dell'equazione di stato del silicio.
# Richiede il file "Etot_vs_alat.dat", contenente <celldm(1)> e <energy>.
# Genera il file "grafico.ps", un PostScript di 3 pagine.
#

#set term post
#set out 'grafico.ps'
set term pdfcairo enhanced
set out "grafico.pdf"
set xlabel 'Volume per atom (au**3)'
set ylabel 'Energy per atom (Ry)'

# Fit con una parabola:
f(x) = a*x*x + b*x + c
fit f(x) 'Etot_vs_alat.dat' u ($1**3/8):($2/2) via a, b, c
set title 'Fit parabolico'
plot \
     'Etot_vs_alat.dat' u ($1**3/8):($2/2) t "Valori calcolati", \
     f(x) t "Fit parabolico"

# Dal fit parabolico estrai volume, energia e modulo di bulk al minimo:
v0=-b/(2*a)
e0=c-b*b/(4*a)
b0=-b

# La parabola potrebbe essere scritta anche come:
f2(v) = e0 + 0.5*b0 * (v-v0)**2 / v0

# Un guess fisicamente sensato della derivata di B rispetto a P:
b0p=3.5

# Definisci equazione di stato di Murnaghan:
m(v) = e0 + b0*v/b0p * ( (v0/v)**b0p / (b0p-1) + 1 )  - b0*v0/(b0p-1)

# Come interpola l'equazione di Murnaghan, con i parametri calcolati sopra?
set title 'Fit parabolico vs Murnaghan, con parametri dal fit parabolico'
#plot \
#     'Etot_vs_alat.dat' u ($1**3/8):($2/2) t "Valori calcolati", \
#     f(x) t "Fit parabolico",                                 
#     m(x) lw 2 t "Murnaghan (parametri dal fit parabolico)"

# Finalmente, il fit con l'equazione di Murnaghan:
fit m(x) 'Etot_vs_alat.dat' u ($1**3/8):($2/2) via e0, b0, v0, b0p
#set title 'Fit parabolico vs Murnaghan, con parametri da Murnaghan'
#    f2(x) t "Parabolic fit using Murnaghan parameters",       \
#set title 'Parabolic vs Murnaghan fit, using parameters from the fit to the Murnaghan EOS'
set title 'Parabolic fit vs Murnaghan EOS fit'
plot \
     'Etot_vs_alat.dat' u ($1**3/8):($2/2) lc "black" t "Calculated data", \
     f(x) w l dt 2 lc "red" t "Parabolic fit to data",                                 \
     m(x) w l lw 2 lt 1 lc "blue" t "Murnaghan fit"

b0GPa=b0*(147e11/1e9)
b0Mbar=b0GPa/100

print "";print "";print "";print "";print "";print "";print "";print "";
print "********************************************************************************"
print "* Energy at minimum   = ",e0," Ry"
print "* Volume at minimum   = ",v0," au^3/atom"
print "* Lattice constant    = ",((v0*8)**(1./3.))," au"
print "*                     = ",((v0*8)**(1./3.))*0.529," Angstrom"
print "* Bulk modulus        = ",b0," au"
print "*                     = ",b0GPa," GPa"
print "*                     = ",b0Mbar," Mbar"
print "********************************************************************************"
print ""
