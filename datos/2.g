#!/usr/bin/gnuplot

set terminal epslatex size 18cm,10cm
set output '2.tex'

set title
set xlabel '$\theta_i$ (\si{\degree})'
set ylabel 'R'
set grid x,y
set yrange[0:1]
set xrange[0:90]
set samples 20000
set key top left

N=1.8051

cost(x)=(1-(sin(x)/N)**2)**(0.5)
s(x)=(cos(x)-N*cost(x))/(cos(x)+N*cost(x))
p(x)=(cost(x)-N*cos(x))/(cost(x)+N*cos(x))

plot s(x/180*pi)**2 ls 1 lw 3 notitle, p(x/180*pi)**2 ls 2 lw 3 notitle, 's2' u 1:($2/1910) ls 1 ps 3 lw 3 title 's-polarizace', 'p2' u 1:($2/1640) ls 2 ps 2 lw 3 title 'p-polarizace'

set terminal wxt
set output
