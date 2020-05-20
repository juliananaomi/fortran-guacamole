set terminal qt

#set autoscale xyz
#set pm3d
#set hidden3d
set xlabel 't'
set ylabel 'y'
set zlabel 'x'
set tics nomirror out scale 0.75
set datafile separator whitespace
set yrange [0:110]
y(x) = 100 - (10*x*x)/2
plot y(x) 

plot '1.dat' u 1:2 with l lc 9 t 'v = 0 m/s, at = 0.01', \
'2.dat' u 1:2:3 with l t 'v = 5 m/s, at = 0.01', \
'3.dat' u 1:2:3 with l t 'v = 10 m/s, at = 0.01', \
y(x)
#'4.dat' u 1:2:3 with l

