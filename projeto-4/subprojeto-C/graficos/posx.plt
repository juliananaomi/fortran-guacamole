reset 

# MACROS
set macros

TOP=0.99
DY = 0.1

set lmargin at screen 0.15
set rmargin at screen 0.95

# x- and ytics for each row resp. column
NOXTICS = "set xtics format ''; unset xlabel"
XTICS = "set format x; set xlabel 'tempo'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'x(t)'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.45, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst

 set key left top
 
# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set xrange [0:7]
set yrange [0:90]
set label 1 'Computacional / Ɛ = 0.001 / v = 10 m/s' @POS
plot '11.dat' u 1:3 with l lc 9 t 'α = 45°', \
'12.dat' u 1:3 with l t 'α= 0°', \
'13.dat' u 1:3 with l lw 2 t 'α= -45°'

# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS
set xrange [0:7]
set yrange [0:90]
set label 1 'Analítico / v = 10 m/s' at graph 0.68, 0.1 font ',10'
a(x) = 10*cos(pi/4)*x
b(x) = 10*cos(0)*x
c(x) = 10*cos(-pi/4)*x
plot  a(x) t 'α = 45°', \
b(x) t 'α= 0°', \
c(x) t 'α= -45°'

#unset multiplot
