reset 

# MACROS
set macros

TOP=0.99
DY = 0.1

set lmargin at screen 0.15
set rmargin at screen 0.95

# x- and ytics for each row resp. column
NOXTICS = "set xtics (''0, '' 1,'' 2, '' 3, '' 4, '' 5, ''6,''6.5); \
          unset xlabel"
XTICS = "set xtics (0, 1, 2, 3, 4, 5, 6);\
          set xlabel 'tempo'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'y(t)'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.02, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst

# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set xrange [0:6.5]
set label 1 'Computacional / Ɛ = 0.001 / v = 20 m/s' @POS
plot '14.dat' u 1:2 with l lc 9 t 'α = 45°', \
'15.dat' u 1:2 with l t 'α= 0°', \
'16.dat' u 1:2 with l t 'α= -45°'

# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS

set label 1 'Analítico / v = 20 m/s' @POS
a(x) = 100 + 20*sin(pi/4)*x - (10*x*x)/2
b(x) = 100 + 20*sin(0)*x - (10*x*x)/2
c(x) = 100 + 20*sin(-pi/4)*x - (10*x*x)/2
set xrange [0:6.5]
set yrange [0:120]
plot  a(x) t 'α = 45°', \
b(x) t 'α= 0°', \
c(x) t 'α= -45°'

#unset multiplot
