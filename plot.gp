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
set output "plots/C_1.x.E3s_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/1_W_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_W_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_W_E3_second_pu.dat' using 1:2 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set ylabel "U contribution [t/GWey]"
set output "plots/C_1.x.E3s_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/1_W_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_W_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_W_E3_second_u.dat' using 1:2 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key center left
set output "plots/C_1.x.J1s_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/1_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/1_W_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_W_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_W_J1_second_pu.dat' using 1:2 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "plots/C_1.x.J1s_u_contribution.png"
plot [0.25:100][] 'processed_data/1_M_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/1_W_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_W_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_W_J1_second_u.dat' using 1:2 with linespoints title columnheader

#PLOT J1 contribution stograe:
set key top right
set output "plots/C_1.x.MOX.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:100][] 'processed_data/1_M_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_M_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_M_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/1_W_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_W_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_W_MOX_fuel_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader

#PLOT J1 contribution stograe:
set key center right
set output "plots/C_1.x.LWR_OUT_.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:100][] 'processed_data/1_M_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_M_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_M_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/1_W_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_W_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_W_LWR_OUT_pu.dat' using 1:($2/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:($2*18/54/6.58036*100) with linespoints title columnheader





#PLOT J1 contribution stograe:

#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.3_MLP-STD-2.J1_STR.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_M.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_M_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_M_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_M_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_M_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_M_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader

set key top left
set output "plots/C_1.3_M.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_M_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_M_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_M_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_M_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_M_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_M_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_M_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_M_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_M_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_M_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_M_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


set key top left
set output "plots/C_1.3_M_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_M_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_M_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_M_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_M_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_M_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader
###################################################################################
###################################################################################



#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_W.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_W_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_W_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_W_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_W_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_W_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader

set key top left
set output "plots/C_1.3_W.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_W_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_W_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_W_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_W_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_W_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_W_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_W_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_W_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_W_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_W_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_W_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


set key top left
set output "plots/C_1.3_W_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_W_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_W_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_W_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_W_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_W_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader
###################################################################################


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader

set key top left
set output "plots/C_1.3_MLP.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


set key top left
set output "plots/C_1.3_MLP_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader
###################################################################################
###################################################################################



#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP-STD.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader

set key top left
set output "plots/C_1.3_MLP-STD.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP-STD_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP-STD_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


set key top left
set output "plots/C_1.3_MLP-STD_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader
###################################################################################
###################################################################################



#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP-STD-2.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader

set key top left
set output "plots/C_1.3_MLP-STD-2.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key top left
set output "plots/C_1.2_MLP-STD-2_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-2_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader


set key top left
set output "plots/C_1.3_MLP-STD-2_LWR_OUT.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][] 'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-2_LWR_OUT_pu.dat' using 1:7 with linespoints title columnheader
###################################################################################


#PLOT E3s Pu :
set key bottom left
set ylabel "Pu contribution [t/GWey]"
set output "plots/C_1.x_M.E3s_pu_contribution.png"
plot [0.25:100][0.199:0.202] 'processed_data/1_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_E3_second_pu.dat' using 1:2 with linespoints title columnheader


#PLOT E3s U :
set key top left
set ylabel "U contribution [t/GWey]"
set output "plots/C_1.x_M.E3s_u_contribution.png"
plot [0.25:100][0.87:0.89] 'processed_data/1_M_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_E3_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_E3_second_u.dat' using 1:2 with linespoints title columnheader

#PLOT J1s Pu:
set ylabel "Pu contribution [t/GWey]"
set key bottom left
set output "plots/C_1.x_M.J1s_pu_contribution.png"
plot [0.25:100][] 'processed_data/1_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_second_pu.dat' using 1:2 with linespoints title columnheader

#PLOT J1s U :
set key bottom left
set ylabel "U contribution [t/GWey]"
set output "plots/C_1.x_M.J1s_u_contribution.png"
plot [0.25:100][] 'processed_data/1_m_j1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_second_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_second_u.dat' using 1:2 with linespoints title columnheader

#PLOT J1p Pu :
set key bottom left
set output "plots/C_1.x_M.J1p_pu_contribution.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][0.035:0.045] 'processed_data/1_M_J1_prime_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_prime_pu.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_prime_pu.dat' using 1:2 with linespoints title columnheader

#PLOT J1p U:
set key bottom left
set ylabel "U contribution [t/GWey]"
plot [0.25:100][0.6:0.604] 'processed_data/1_M_J1_prime_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/2_M_J1_prime_u.dat' using 1:2 with linespoints title columnheader, \
  'processed_data/3_M_J1_prime_u.dat' using 1:2 with linespoints title columnheader
