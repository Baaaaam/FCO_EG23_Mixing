#!/usr/bin/env python
import numpy as np

def read(filename):
  my_file = open(filename, 'r')
  data = my_file.readlines()
  driver_E1 = []
  driver_E2 = []
  blt_nat = []
  blt_E4 = []
  
  for line in data:
    words = line.split()
    if(words[4] == "FBR_driver_fabrication" and words[5] == "E1_second_stored" ):
      driver_E1.append( [int(words[0]),float(words[6])] )
    if(words[4] == "FBR_driver_fabrication" and words[5] == "E2_second_stored" ):
      driver_E2.append( [int(words[0]),float(words[6])] )
    if(words[4] == "FBR_blanket_fabrication" and words[5] == "natl_u" ):
      blt_nat.append( [int(words[0]),float(words[6])] )
    if(words[4] == "FBR_blanket_fabrication" and words[5] == "E4_stored" ):
      blt_E4.append( [int(words[0]),float(words[6])] )

  print(filename,": ", len(driver_E1), " ", len(driver_E2), " ", len(blt_nat), " ", len(blt_E4)) 
  return [driver_E1,driver_E2,blt_nat,blt_E4]

def read_data():
  case = [ 1, 2, 3 ]
#  method = [ '', '_M' ]
  method = [ '_M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]
  pu_contrib = []
  u_contrib = []
  for case_ in case:
    
    for method_ in method:
      pu_contrib_ =[]
      u_contrib_ =[]
      if (case_ == 1 ):
        filename = 'data/EG29_Case.2.' + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        tmp1,tmp2,tmp3,tmp4 = read(filename)
        pu_contrib_.append([tmp1,tmp2])
        
        filename = 'data/EG29_Case.2.' + str(case_) + method_ + '.trans.' + 'u' + str(8)
        tmp1,tmp2,tmp3,tmp4 = read(filename)
        u_contrib_.append([tmp1,tmp2])

      else :
        for pu_ in pu:
          filename = 'data/EG29_Case.2.' + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
          tmp1,tmp2,tmp3,tmp4 = read(filename)
          pu_contrib_.append([tmp1,tmp2])
        for u_ in u:
          filename = 'data/EG29_Case.2.' + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          tmp1,tmp2,tmp3,tmp4 = read(filename)
          u_contrib_.append([tmp1,tmp2])
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib,u_contrib


def main():
  pu_contrib, u_contrib = read_data()

  drv_E1_pu_contrib_relativ = []
  drv_E2_pu_contrib_relativ = []
  drv_E1_total_pu = []
  drv_E2_total_pu = []

  for case_ in pu_contrib:
    drv_E1_total_pu_ = []
    drv_E2_total_pu_ = []
    drv_E1_pu_contrib_relativ_ = []
    drv_E2_pu_contrib_relativ_ = []

    for i in range(len(case_[0][0])):
      drv_E1_total_pu_.append( [case_[0][0][i][0],0] )
      drv_E2_total_pu_.append( [case_[0][0][i][0],0] )

    for pu in case_:
      for i in range(len(pu[0])):
        drv_E1_total_pu_[i][1] += pu[0][i][1]
        drv_E2_total_pu_[i][1] += pu[1][i][1]

    for pu in case_:
      for i in range(len(pu[0])):
        pu[0][i][1] *= 1/drv_E1_total_pu_[i][1]
        pu[1][i][1] *= 1/drv_E2_total_pu_[i][1]
      drv_E1_pu_contrib_relativ_.append(pu[0])
      drv_E2_pu_contrib_relativ_.append(pu[1])

    drv_E1_total_pu___ = np.copy(drv_E1_total_pu_)
    drv_E2_total_pu___ = np.copy(drv_E2_total_pu_)
    for i in range(len(case_[0][0])):
      drv_E1_total_pu_[i][1] *= 0.001/0.36*0.7/1.5#(drv_E1_total_pu___[i][1]+drv_E2_total_pu___[i][1])
      drv_E2_total_pu_[i][1] *= 0.001/0.36*0.7/1.5#(drv_E1_total_pu___[i][1]+drv_E2_total_pu___[i][1])

    drv_E1_total_pu.append(drv_E1_total_pu_)
    drv_E2_total_pu.append(drv_E2_total_pu_)
    drv_E1_pu_contrib_relativ.append(drv_E1_pu_contrib_relativ_)
    drv_E2_pu_contrib_relativ.append(drv_E2_pu_contrib_relativ_)


  case = [ 1, 2, 3 ]
#  method = [ 'W', 'M' ]
  method = [ 'M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]

  file = open("drv_E1_output_pu.dat","w")

  name = "Time "
  file.write(name)
  for case_ in case:
    for method_ in method:
      name = "1." + str(case_) + "-" + method_ + "-Pu-Total "
      file.write(name)
      if ( case_ == 1 ):
        name = "1." + str(case_) + "-" + method_ + "-Pu9 "
        file.write(name)
      else :
        for pu_ in pu:
          name = "1." + str(case_) + "-" + method_ + "-Pu" + str(pu_) + " "
          file.write(name)
  file.write("\n")

  for i in range(len(drv_E1_total_pu[0])):
    file.write( str(drv_E1_total_pu[0][i][0]/12.) )
    file.write(" ")
    for j in range(len(drv_E1_total_pu)):
      if ( len(drv_E1_total_pu[j]) < i+1 ):
        file.write(str(0))
      else:
        file.write( str(drv_E1_total_pu[j][i][1]) )
      file.write(" ")
      for k in range(len(drv_E1_pu_contrib_relativ[j])):
        if ( len(drv_E1_pu_contrib_relativ[j][k]) < i+1 ):
          file.write(str(0))
        else:
          file.write( str(drv_E1_pu_contrib_relativ[j][k][i][1]) )
        file.write(" ")
    file.write("\n")
  file.close()

  file = open("drv_E2_output_pu.dat","w")
  
  name = "Time "
  file.write(name)
  for case_ in case:
    for method_ in method:
      name = "1." + str(case_) + "-" + method_ + "-Pu-Total "
      file.write(name)
      if ( case_ == 1 ):
        name = "1." + str(case_) + "-" + method_ + "-Pu9 "
        file.write(name)
      else :
        for pu_ in pu:
          name = "1." + str(case_) + "-" + method_ + "-Pu" + str(pu_) + " "
          file.write(name)
  file.write("\n")

  for i in range(len(drv_E2_total_pu[0])):
    file.write( str(drv_E2_total_pu[0][i][0]/12.) )
    file.write(" ")
    for j in range(len(drv_E2_total_pu)):
      if ( len(drv_E2_total_pu[j]) < i+1 ):
        file.write(str(0))
      else:
        file.write( str(drv_E2_total_pu[j][i][1]) )
      file.write(" ")
      for k in range(len(drv_E2_pu_contrib_relativ[j])):
        if ( len(drv_E2_pu_contrib_relativ[j][k]) < i+1 ):
          file.write(str(0))
        else:
          file.write( str(drv_E2_pu_contrib_relativ[j][k][i][1]) )
        file.write(" ")
    file.write("\n")
  file.close()


main()
