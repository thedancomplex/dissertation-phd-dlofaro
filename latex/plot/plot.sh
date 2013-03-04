#!/bin/bash

BASE=`echo $1 | sed -e 's/\.dat$//'`

gnuplot <<EOF
bin(x,width)=width*floor(x/width)

set ylabel "count"
set xlabel "microseconds"

set style fill solid
set term postscript eps enhanced color 24

binwidth=.1
set output "$BASE.eps
plot '$BASE.dat' using (bin(\$1,binwidth)):(1.0) title '' lc 3 smooth freq with boxes

EOF
