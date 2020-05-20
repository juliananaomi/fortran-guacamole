reset 

# MACROS
set macros

TOP=0.99
DY = 0.23


# x- and ytics for each row resp. column
NOXTICS = "set xtics (''0, '' 1,'' 2, '' 3, '' 4, '' 5, ''6); \
          unset xlabel"
XTICS = "set xtics (0, 1, 2, 3, 4, 5, 6);\
          set xlabel 'tempo'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'v(t)'"


# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.05, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 4,1 rowsfirst

# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen TOP-DY
@NOXTICS; @YTICS
set yrange [0:115]
set xrange [0:6]
set label 1 'Computacional / Ɛ = 0.01' @POS
plot '1.dat' u 1:2 with l lc 9 t 'v = 0 m/s' , \
'2.dat' u 1:2 with l t 'v = 10 m/s'

# --- GRAPH b
set tmargin at screen TOP - DY
set bmargin at screen TOP-2*DY
@NOXTICS; @YTICS
set yrange [0:115]
set xrange [0:6]
set label 1 'Computacional / Ɛ = 0.001' @POS
plot '3.dat' u 1:2 with l lc 9 t 'v = 0 m/s' , \
'4.dat' u 1:2 with l t 'v = 10 m/s'

# --- GRAPH c
set tmargin at screen TOP-2*DY
set bmargin at screen TOP-3*DY
@NOXTICS; @YTICS
set yrange [0:115]
set xrange [0:6]
set label 1 'Computacional / Ɛ = 0.0001' @POS
plot '5.dat' u 1:2 with l lc 9 t 'v = 0 m/s' , \
'6.dat' u 1:2 with l t 'v = 10 m/s'

# --- GRAPH d
set tmargin at screen TOP-3*DY
set bmargin at screen TOP-4*DY
@XTICS; @YTICS
set label 1 'Analítico' @POS
set yrange [0:115]
set xrange [0:6]
y(x) = 100 - (10*x*x)/2 
b(x) = 100 + 10*x - (10*x*x)/2
plot y(x) t 'v = 0 m/s', \
b(x) t 'v = 10 m/s'
