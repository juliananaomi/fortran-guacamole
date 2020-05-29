reset 

# MACROS
set macros

TOP=0.99
DY = 0.1

set lmargin at screen 0.15
set rmargin at screen 0.95

# x- and ytics for each row resp. column
NOXTICS = "set xtics (''0, ''50, ''100, ''150, ''200, ''250); \
          unset xlabel"
XTICS = "set xtics (0, 50, 100, 150, 200, 250);\
          set xlabel 'x'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = " set ylabel 'y(x)'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.57, 0.78 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst

set yrange [0:110]
set xrange [0:100]

# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set xrange [0:130]
set yrange [0:120]

set label 1 'Ɛ = 0.001 / v = 10 m/s / dx = 0.3' @POS
plot '11.dat' u 3:2 with l lc 3 t 'α = 45°', \
'12.dat' u 3:2 with l lc 4 t 'α= 0°', \
'13.dat' u 3:2 with l lc 7 t 'α= -45°'

# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS
set label 1 'Ɛ = 0.001 / v = 10 m/s / dx = 0.5' @POS
plot '14.dat' u 3:2 with l lc 3 t 'α = 45°', \
'15.dat' u 3:2 with l lc 4 t 'α= 0°', \
'16.dat' u 3:2 with l lc 7 t 'α= -45°'

#unset multiplot
