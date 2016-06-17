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

#PLOT E1p contribution stograe:
set key bottom left
set output "C_2.x.E1p_FBR_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_E1_prime_FBR_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E1_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E1_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E1p contribution stograe:
set key bottom left
set output "C_2.x.E1p_FBR_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E1s contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E1s_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E1s contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E1s_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E2p contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E2p_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E2p contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E2p_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E2s contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E2s_FBR_pu_contribution.png"
plot [0.25:100][0.128:0.132] 'processed_data/1_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E2s contribution stograe:
set key top left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E2s_FBR_u_contribution.png"
plot [0.25:100][1.43:1.435] 'processed_data/1_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3p contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E3p_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3p contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E3p_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s FBR contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E3s_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s FBR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E3s_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s PWR contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "C_2.x.E3s_PWR_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s PWR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E3s_PWR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E4_FBR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "C_2.x.E4_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT J1p contribution stograe:
set key bottom left
set output "C_2.x.J1p_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_J1_prime_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_J1_prime_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_J1_prime_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT J1p contribution stograe:
set key bottom left
set output "C_2.x.J1p_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader

#PLOT J1s contribution stograe:
set key bottom left
set output "C_2.x.J1s_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_J1_second_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_J1_second_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_J1_second_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT J1s contribution stograe:
set key bottom left
set output "C_2.x.J1s_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/2_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/3_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader



























set key bottom left
set output "Y_C_2.x.E1p_FBR_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_E1_prime_FBR_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E1_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E1_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E1p contribution stograe:
set key bottom left
set output "Y_C_2.x.E1p_FBR_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E1_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E1s contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E1s_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E1_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E1s contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E1s_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E1_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E2p contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E2p_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E2_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E2p contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E2p_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E2_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E2s contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E2s_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E2_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E2s contribution stograe:
set key top left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E2s_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E2_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3p contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E3p_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_prime_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3p contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E3p_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_prime_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s FBR contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E3s_FBR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_second_FBR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s FBR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E3s_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_second_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s PWR contribution stograe:
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "Y_C_2.x.E3s_PWR_pu_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_second_PWR_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT E3s PWR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E3s_PWR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E3_second_PWR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT E4_FBR contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "Y_C_2.x.E4_FBR_u_contribution.png"
plot [0.25:100][] 'processed_data/y_1_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_E4_FBR_u.dat' using 1:($2) with linespoints title columnheader

#PLOT J1p contribution stograe:
set key bottom left
set output "Y_C_2.x.J1p_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_J1_prime_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_J1_prime_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_J1_prime_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT J1p contribution stograe:
set key bottom left
set output "Y_C_2.x.J1p_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_J1_prime_u.dat' using 1:($2) with linespoints title columnheader

#PLOT J1s contribution stograe:
set key bottom left
set output "Y_C_2.x.J1s_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_J1_second_pu.dat'  using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_J1_second_pu.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_J1_second_pu.dat' using 1:($2) with linespoints title columnheader

#PLOT J1s contribution stograe:
set key bottom left
set output "Y_C_2.x.J1s_u_contribution.png"
set ylabel "U contribution [t/GWey]"
plot [0.25:100][] 'processed_data/y_1_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_2_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader, \
  'processed_data/y_3_M_J1_second_u.dat' using 1:($2) with linespoints title columnheader


