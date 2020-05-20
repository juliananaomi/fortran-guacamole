reset 

# MACROS
set macros

TOP=0.99
DY = 0.1



# x- and ytics for each row resp. column
NOXTICS = "set xtics format ''; unset xlabel"
XTICS = "set format x; set xlabel 'tempo'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'v(t)'"

set key outside

# Placement of the a,b,c,d labels in the graphs
POS = "at graph 0.05, 0.1 font ',10'"

### Start multiplot (2x1 layout)
set multiplot layout 2,1 rowsfirst

set xrange [0:33]
# --- GRAPH a
set tmargin at screen TOP
set bmargin at screen 0.55*TOP
@NOXTICS; @YTICS
set ylabel 'y(t)'
set yrange [0:2100]
set lmargin at screen 0.1
set rmargin at screen 0.7

set arrow from 30.469999318942428, -200 to 30.469999318942428,200 nohead lc 9
set arrow from 21.709999514743686, -200 to 21.709999514743686,200 nohead lc 18
set arrow from 29.469999341294169, -200 to 29.469999341294169,200 nohead lc 14
set arrow from 20.679999537765980, -200 to 20.679999537765980,200 nohead lc 20

plot '13.dat' u 1:2 with l lw 2 lc 9 t 'v = 10 m/s, res = 0.1', \
'14.dat' u 1:2 with l lw 2 t 'v = 10 m/s, res = 0.01', \
'11.dat' u 1:2 with l lw 2 lc 14 t 'v = 0 m/s, res = 0.1', \
'12.dat' u 1:2 with l lw 2 t 'v = 0 m/s, res = 0.01', \


# --- GRAPH b
set tmargin at screen TOP - 0.45*TOP
set bmargin at screen DY
@XTICS; @YTICS
set ylabel 'v(t)'
set yrange [-200:0]

plot '13.dat' u 3:4 with l lw 2 lc 9 t 'v = 10 m/s, res = 0.1', \
'14.dat' u 3:4 with l lw 2 t 'v = 10 m/s, res = 0.01', \
'11.dat' u 3:4 with l lw 2 lc 14 t 'v = 0 m/s, res = 0.1', \
'12.dat' u 3:4 with l lw 2 t 'v = 0 m/s, res = 0.01', \

#unset multiplot
