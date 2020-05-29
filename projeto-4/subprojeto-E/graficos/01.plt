set terminal qt

reset 

set autoscale xy

#set pm3d
#set hidden3d
set xlabel 'x'
set ylabel 'y(x)'
set zlabel 'x'
set tics nomirror out scale 0.75
set datafile separator whitespace

POS = "at graph 0.015, 0.05 font ',10'"

set label 1 'Ɛ = 0.001 / v = 10 m/s' @POS
plot '17.dat' u 3:2 with l lc 3 t 'α = 45°', \
'21.dat' u 3:2 with l lc 4  t 'α= 0°', \
'16.dat' u 3:2  with l lc 7 t 'α= -45°'
