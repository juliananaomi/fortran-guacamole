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
YTICS = "set format y '%.0f'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.55, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst


# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set ylabel 'v_y(t)'
set label 1 'Ɛ = 0.001 / v = 20 m/s / dx = 0.3' @POS
plot '20.dat' u 4:5 with l lc 3 t 'α = 45°', \
'21.dat' u 4:5  with l lc 4 t 'α= 0°', \
'22.dat' u 4:5  with l lc 7 t 'α= -45°'

# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS
set ylabel 'v_x(t)'
set label 1 'Ɛ = 0.001 / v = 20 m/s /dx = 0.3' at 0.5, 1.7
plot '20.dat' u 4:6 with l lc 3 t 'α = 45°', \
'21.dat' u 4:6 with l lc 4 t 'α= 0°', \
'22.dat' u 4:6 with l lc 7 t 'α= -45°'
#unset multiplot
