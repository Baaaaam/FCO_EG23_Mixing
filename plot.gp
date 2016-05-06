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

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x.E3s_pu_contribution.png"
plot [0.25:100][] 'E3_second_pu.dat'  using 1:2 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader, \
  '' using 1:18 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:12 with linespoints title columnheader, \
  '' using 1:24 with linespoints title columnheader
  

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x.E3s_u_contribution.png"
plot [0.25:100][] 'E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:8 with linespoints title columnheader, \
  '' using 1:12 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x.J1s_pu_contribution.png"
plot [0.25:100][] 'J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader, \
  '' using 1:18 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:12 with linespoints title columnheader, \
  '' using 1:24 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x.J1s_u_contribution.png"
plot [0.25:100][] 'J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:8 with linespoints title columnheader, \
  '' using 1:12 with linespoints title columnheader


###################################################################################
###################################################################################
###################################################################################

set key bottom left
set output "C_1.x_M.E3s_pu_contribution.png"
plot [0.25:100][] 'E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader
  

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x_M.E3s_u_contribution.png"
plot [0.25:100][] 'E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x_M.J1s_pu_contribution.png"
plot [0.25:100][] 'J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x_M.J1s_u_contribution.png"
plot [0.25:100][] 'J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader



#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x_M.J1p_pu_contribution.png"
plot [0.25:100][0.038:0.042] 'J1_prime_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_1.x_M.J1p_u_contribution.png"
plot [0.25:100][] 'J1_prime_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader
