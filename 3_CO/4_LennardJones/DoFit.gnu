#!/usr/bin/gnuplot
#
# Script di gnuplot per fare il fit con il potenziale di Lennard-Jones.

NAME="e_vs_bondl.dat"

set term pdfcairo enhanced
set out "fit.pdf"

set xlabel 'Bond Lenght (Bohr)'
set ylabel 'E_{tot} (Ry)'
set xrange [1:]
set yrange [-1:5]

#Energy offset taken from the binding energy calculation (Total energy for isolated atoms)
#OFFSET= E_tot(O) + E_tot(C)
OFFSET=-42.24355816


# Fit con una parabola:
f(x) = a*x*x + b*x + c
fit [1.8:2.4] f(x) NAME u 1:($2-OFFSET) via a, b, c

set title 'Fit parabolico'
plot \
     NAME u 1:($2-OFFSET) pt 7 ps 0.5 t "Valori calcolati", \
     f(x) t "Fit parabolico"


# Dal fit parabolico estrai raggio equilibrio, energia:
rm=-b/(2*a)
e0=c-b*b/(4*a)
rm1=rm

print "rm(parabolic) = ", rm
print "e0(parabolic) = ", e0

# Definisci potenziale Lennard-Jones:
l(x) = -e0 * ((rm/x)**(2*ex) - 2*(rm/x)**ex)
ex=6

# Come interpola l'equazione di Murnaghan, con i parametri calcolati sopra?
set title 'Fit parabolico vs Lennard-Jones'

# Fit con l'equazione di Lennard-Jones:
fit l(x) NAME u 1:($2-OFFSET) via e0, rm, ex
set title 'Fit parabolico vs Lennard-Jones'
plot \
     NAME u 1:($2-OFFSET) t "Valori calcolati", \
     f(x) t "Fit parabolico", \
     l(x) lw 2 t "Lennard-Jones"


print "";print "";print "";print "";print "";print "";print "";print "";
print "********************************************************************************"
print "* Energia al minimo    = ",e0," Ry"
print "* Lunghezza legame(lj) = ",rm," Bohr"
print "* L. legame(parabol.)  = ",rm1," Bohr"
print "* Esponente            = ",ex
print "********************************************************************************"
print ""




