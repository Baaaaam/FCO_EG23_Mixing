#!/usr/bin/env gnuplot

set grid xtics ytics
show grid
set key center right autotitle columnheader box
set terminal png size 1000,750 enhanced font "Helvetica,20"
show xlabel
show ylabel

set xlabel "Date [y]"
set ylabel "Pu contribution [t/GWey]"



#PLOT J1 contribution stograe:
set key bottom right
set output "plots_paper/nodecay.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:300][5:15] 'processed_data/2_M_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "blue" title "fix no-decay", \
  'processed_data/2_W_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "dark-green" title "Pu-eq no-decay", \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "red" title "NN no-decay"

#PLOT J1 contribution stograe:
set key bottom right
set output "plots_paper/decay.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:300][5:15] 'processed_data/2_M_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "blue" title "fix no-decay", \
  'processed_data/3_M_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with  lines lw 2 lt 2 dt 2 lc rgb "blue" title "fix decay", \
  'processed_data/2_W_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "dark-green" title "Pu-eq no-decay", \
  'processed_data/3_W_MOX_fuel_pu.dat' every ::1 using 1:($2/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "dark-green"title "Pu-eq decay", \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "red" title "NN no-decay", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "red" title "NN decay"



set key top left
set output "plots_paper/decay.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][0:0.75] 'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader, \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' using 1:8 with linespoints title columnheader


set key top left
set output "plots_paper/decay_recipe.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][0:0.75] 'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader, \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:8 with linespoints title columnheader

set key center right
#set key width +2
#set key height +1
set output "plots_paper/MOX.pu_composition.png"
set ylabel "Plutonium composition [%]"
plot [0.25:300][0:0.75] NaN with lines lw 2 lt 2 dt 2 lc rgb "black" title "NN decay recipe" , \
  NaN with lines lw 2 dashtype 1 lc rgb "black" title "NN decay depletion" , \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:3 with lines lw 2 dashtype 1 lc rgb "red" title "^{238}Pu", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:4 with lines lw 2 dashtype 1 lc rgb "blue" title "^{239}Pu", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:5 with lines lw 2 dashtype 1 lc rgb "dark-green" title "^{240}Pu", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:6 with lines lw 2 dashtype 1 lc rgb "orange" title "^{241}Pu", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:7 with lines lw 2 dashtype 1 lc rgb "dark-blue" title "^{242}Pu", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:8 with lines lw 2 dashtype 1 lc rgb "dark-pink" title "^{241}Am", \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:3 with lines lw 2 lt 2 dt 2 lc rgb "red" notitle , \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:4 with lines lw 2 lt 2 dt 2 lc rgb "blue" notitle , \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:5 with lines lw 2 lt 2 dt 2 lc rgb "dark-green" notitle , \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:6 with lines lw 2 lt 2 dt 2 lc rgb "orange" notitle , \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:7 with lines lw 2 lt 2 dt 2 lc rgb "dark-blue" notitle , \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:8 with lines lw 2 lt 2 dt 2 lc rgb "dark-pink" notitle 


set key width +0
set key height +0
set key top left
set output "plots_paper/no_decay_recipe.MOX.pu_composition.png"
set ylabel "Pu contribution [t/GWey]"
plot [0.25:100][0:0.75] 'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:3 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:4 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:5 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:6 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:7 with linespoints title columnheader, \
  'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' using 1:8 with linespoints title columnheader


#PLOT J1 contribution stograe:
set key bottom right
set output "plots_paper/irradiation.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:300][5:15] 'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "red" title "NN no-decay recipe", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "red" title "NN decay recipe", \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "orange"  title "NN no-decay depletion", \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "orange" title "NN decay depletion"


#PLOT J1 contribution stograe:
set key bottom right
set output "plots_paper/storage.pu_contribution.png"
set ylabel "Pu fraction in the LWR MOX fuel [%]"
plot [0.25:300][5:15] 'processed_data/2_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "red" title "NN no-decay recipe", \
  'processed_data/2_MLP-STD-recipe-od_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "red" title "NN no-decay recipe OD", \
  'processed_data/3_MLP-STD-recipe_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "red" title "NN decay recipe", \
  'processed_data/3_MLP-STD-recipe-od_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 4 lc rgb "red" title "NN decay recipe OD", \
  'processed_data/2_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "orange"  title "NN no-decay depletion", \
  'processed_data/2_MLP-STD-od_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 dashtype 1 lc rgb "orange"  title "NN no-decay depletion OD", \
  'processed_data/3_MLP-STD_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 2 lc rgb "orange" title "NN decay depletion", \
  'processed_data/3_MLP-STD-od_MOX_fuel_pu.dat' every ::1 using 1:($2*18/54/(29565*0.001*0.3/0.9/1.5)*100) with lines lw 2 lt 2 dt 4 lc rgb "orange" title "NN decay depletion OD"
