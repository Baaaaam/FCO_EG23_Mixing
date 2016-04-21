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


  return blanket,Pu_storage

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
        filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        tmp = read(filename)
        pu_contrib_.append(tmp)
        
        filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(8)
        tmp = read(filename)
        u_contrib_.append(tmp)

      else :
        for pu_ in pu:
          filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
          tmp = read(filename)
          pu_contrib_.append(tmp)
        for u_ in u:
          filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          tmp = read(filename)
          u_contrib_.append(tmp)
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib,u_contrib


def main():
  pu_contrib, u_contrib = read_data()

  for case in pu_contrib:
    stg_total_pu = []
    bkt_total_pu = []
    for i in range(len(case[0][0])):
      stg_total_pu.append( [case[0][0][i][0],0] )
      bkt_total_pu.append( [case[0][0][i][0],0] )
    for pu in case:
      for i in range(len(pu[0])):
        stg_total_pu[i][1] += pu[0][i][1]
        bkt_total_pu[i][1] += pu[1][i][1]
    for pu in case:
      for i in range(len(pu[0])):
        pu[0][i][1] *= 1/stg_total_pu[i][1]
        pu[1][i][1] *= 1/bkt_total_pu[i][1]

    print(stg_total_pu)



main()