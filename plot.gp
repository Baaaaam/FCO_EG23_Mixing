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
set output "C_2.x.E1p_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][0.105:0.11] 'E1_prime_pu.dat'  using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set output "C_2.x.E1p_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][0.8205:0.821] 'E1_prime_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E1s_pu_contribution.png"
plot [0.25:100][] 'E1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E1s_u_contribution.png"
plot [0.25:100][5.975:5.985] 'E1_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E2p_pu_contribution.png"
plot [0.25:100][] 'E2_prime_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E2p_u_contribution.png"
plot [0.25:100][0.195165:0.19517] 'E2_prime_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E2s_pu_contribution.png"
plot [0.25:100][] 'E2_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key top left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E2s_u_contribution.png"
plot [0.25:100][1.474:1.476] 'E2_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E3p_pu_contribution.png"
plot [0.25:100][0.0233:0.0234] 'E3_prime_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E3p_u_contribution.png"
plot [0.25:100][0.101893:0.101894] 'E3_prime_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E3s_pu_contribution.png"
plot [0.25:100][0.2009:0.2015] 'E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:10 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E3s_u_contribution.png"
plot [0.25:100][0.877902:0.877907] 'E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E4_u_contribution.png"
plot [0.25:100][] 'E4_u.dat' using 1:2 with linespoints title columnheader, \
  '' using 1:4 with linespoints title columnheader, \
  '' using 1:6 with linespoints title columnheader



