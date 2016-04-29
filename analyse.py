#!/usr/bin/env python
import numpy as np

def read(filename):
  my_file = open(filename, 'r')
  data = my_file.readlines()
  blanket = []
  Pu_storage = []
  
  for line in data:
    words = line.split()
    if(words[4] == "PWR_fabrication" and words[5] == "FBR_blanket_Upu_stored" ):
      blanket.append( [int(words[0]),float(words[6])] )
    if(words[4] == "PWR_fabrication" and words[5] == "PWR_Upu_stored" ):
      Pu_storage.append( [int(words[0]),float(words[6])] )


  return [Pu_storage,blanket]

def read_data():
  case = [ 1, 2, 3 ]
  method = [ '', '_M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]
  pu_contrib = []
  u_contrib = []
  for case_ in case:
    
    for method_ in method:
      pu_contrib_ =[]
      u_contrib_ =[]
      if (case_ == 1 ):
        filename = 'data/EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        tmp1,tmp2 = read(filename)
        pu_contrib_.append([tmp1,tmp2])
        
        filename = 'data/EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(8)
        tmp = read(filename)
        u_contrib_.append([tmp1,tmp2])

      else :
        for pu_ in pu:
          filename = 'data/EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
          tmp1,tmp2 = read(filename)
          pu_contrib_.append([tmp1,tmp2])
        for u_ in u:
          filename = 'data/EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          tmp1,tmp2 = read(filename)
          u_contrib_.append([tmp1,tmp2])
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib,u_contrib


def main():
  pu_contrib, u_contrib = read_data()

  stg_pu_contrib_relativ = []
  bkt_pu_contrib_relativ = []
  stg_total_pu = []
  bkt_total_pu = []

  for case_ in pu_contrib:
    stg_total_pu_ = []
    bkt_total_pu_ = []
    stg_pu_contrib_relativ_ = []
    bkt_pu_contrib_relativ_ = []

    for i in range(len(case_[0][0])):
      stg_total_pu_.append( [case_[0][0][i][0],0] )
      bkt_total_pu_.append( [case_[0][0][i][0],0] )

    for pu in case_:
      for i in range(len(pu[0])):
        stg_total_pu_[i][1] += pu[0][i][1]
        bkt_total_pu_[i][1] += pu[1][i][1]

    for pu in case_:
      for i in range(len(pu[0])):
        pu[0][i][1] *= 1/stg_total_pu_[i][1]
        pu[1][i][1] *= 1/bkt_total_pu_[i][1]
      stg_pu_contrib_relativ_.append(pu[0])
      bkt_pu_contrib_relativ_.append(pu[1])

    stg_total_pu___ = np.copy(stg_total_pu_)
    bkt_total_pu___ = np.copy(bkt_total_pu_)
    for i in range(len(case_[0][0])):
      stg_total_pu_[i][1] *= 0.001/0.9*0.3/1.5#(stg_total_pu___[i][1]+bkt_total_pu___[i][1])
      bkt_total_pu_[i][1] *= 0.001/0.9*0.3/1.5#(stg_total_pu___[i][1]+bkt_total_pu___[i][1])

    stg_total_pu.append(stg_total_pu_)
    bkt_total_pu.append(bkt_total_pu_)
    stg_pu_contrib_relativ.append(stg_pu_contrib_relativ_)
    bkt_pu_contrib_relativ.append(bkt_pu_contrib_relativ_)


  case = [ 1, 2, 3 ]
  method = [ 'W', 'M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]

  file = open("stg_output_pu.dat","w")

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

  for i in range(len(stg_total_pu[0])):
    file.write( str(stg_total_pu[0][i][0]/12.) )
    file.write(" ")
    for j in range(len(stg_total_pu)):
      file.write( str(stg_total_pu[j][i][1]) )
      file.write(" ")
      for k in range(len(stg_pu_contrib_relativ[j])):
        file.write( str(stg_pu_contrib_relativ[j][k][i][1]) )
        file.write(" ")
    file.write("\n")
  file.close()

  file = open("bkt_output_pu.dat","w")
  
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

  for i in range(len(bkt_total_pu[0])):
    file.write( str(bkt_total_pu[0][i][0]/12.) )
    file.write(" ")
    for j in range(len(bkt_total_pu)):
      file.write( str(bkt_total_pu[j][i][1]) )
      file.write(" ")
      for k in range(len(bkt_pu_contrib_relativ[j])):
        file.write( str(bkt_pu_contrib_relativ[j][k][i][1]) )
        file.write(" ")
    file.write("\n")
  file.close()


main()
