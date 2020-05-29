reset 

# MACROS
set macros

TOP=0.99
DY = 0.1

set lmargin at screen 0.15
set rmargin at screen 0.95

# x- and ytics for each row resp. column
NOXTICS = "set xtics (''0, ''10, ''20,  ''30,  ''40, ''50, ''60, ''70, ''80, ''90); \
          unset xlabel"
XTICS = "set xtics (0, 10, 20, 30,  40, 50, 60, 70, 80, 90);\
          set xlabel 'x'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = " set ylabel 'y(x)'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.02, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst

# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set xrange [0:90]
set yrange [0:120]
set label 1 'Computacional / Ɛ = 0.001 / v = 20 m/s' @POS
plot '14.dat' u 3:2 with l lc 9 t 'α = 45°', \
'15.dat' u 3:2 with l t 'α= 0°', \
'16.dat' u 3:2 with l t 'α= -45°'

# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS
set xrange [0:90]
set yrange [0:120]
set label 1 'Analítico / v = 20 m/s' @POS

a(x) = 100 + x*tan(pi/4) - 5*(x/(20*cos(pi/4)))*(x/(20*cos(pi/4)))
b(x) = 100 + x*tan(0) - 5*(x/(20*cos(0)))*(x/(20*cos(0)))
c(x) = 100 + x*tan(-pi/4) - 5*(x/(20*cos(-pi/4)))*(x/(20*cos(-pi/4)))

set xrange [0:90]
set yrange [0:120]
plot  a(x) t 'α = 45°', \
b(x) t 'α= 0°', \
c(x) t 'α= -45°'

#unset multiplot
