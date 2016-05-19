#!/usr/bin/env gnuplot
#Header
set grid xtics ytics
show grid
set key center right autotitle columnheader box
set terminal png size 1000,750 enhanced font "Helvetica,20"
show xlabel
show ylabel

set xlabel "Date [y]"
set ylabel "Pu contribution [t/GWey]"


#PLOT E3 contribution :
set output "C_1.x.E3_contribution.png"
plot [0.25:100][0.19:0.315] 'bkt_output_pu.dat' using 1:4 with linespoints title columnheader, \
  '' using 1:12 with linespoints title columnheader, '' using 1:24 with linespoints title columnheader, \
  '' using 1:2 with linespoints title columnheader, '' using 1:6 with linespoints title columnheader, \
  '' using 1:18 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x.J1_contribution.png"
plot [0.25:100][0.26:0.36] 'stg_output_pu.dat' using 1:4 with linespoints title columnheader, \
'' using 1:12 with linespoints title columnheader, '' using 1:24 with linespoints title columnheader, \
'' using 1:2 with linespoints title columnheader, '' using 1:6 with linespoints title columnheader, \
'' using 1:18 with linespoints title columnheader

#PLOT J1 contribution storage:
set output "C_1.x.J1_Pu_composition.png"
set key at first 80, first 0.15
set ylabel "Pu isotopic composition [fraction]"
plot [0.25:100][0:0.51] 'stg_output_pu.dat' using 1:19 with linespoints title columnheader, \
'' using 1:20 with linespoints title columnheader, \
'' using 1:21 with linespoints title columnheader, '' using 1:22 with linespoints title columnheader, \
'' using 1:23 with linespoints title columnheader

#PLOT E3 contribution blanket:
set output "C_1.x.E3_Pu_composition.png"
set key default
set key center right autotitle columnheader box
set ylabel "Pu isotopic composition [fraction]"
plot [0.25:100][] 'bkt_output_pu.dat' using 1:19 with linespoints title columnheader, \
'' using 1:20 with linespoints title columnheader, \
'' using 1:21 with linespoints title columnheader, '' using 1:22 with linespoints title columnheader, \
'' using 1:23 with linespoints title columnheader




