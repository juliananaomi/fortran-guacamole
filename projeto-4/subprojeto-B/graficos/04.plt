set terminal qt

set autoscale xy
#set pm3d
#set hidden3d
set xlabel 't'
set ylabel 'y'
set zlabel 'x'
set tics nomirror out scale 0.75
set datafile separator whitespace
#set yrange [0:110]


plot '1.dat' u 3:4 with l lc 9 , \
'2.dat' u 3:4 with l , \
'3.dat' u 3:4 with l , \
'4.dat' u 3:4 with l , \
'5.dat' u 3:4 with l , \
#'4.dat' u 1:2:3 with l

