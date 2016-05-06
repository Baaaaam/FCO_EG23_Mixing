#!/usr/bin/env python
import numpy as np

def read(filename, out_fac, in_fac, commod):
  my_file = open(filename, 'r')
  data = my_file.readlines()
  data_row = []

  for line in data:
    words = line.split()
    if( ( words[2] == out_fac or out_fac == "" )
        and (words[4] == in_fac or in_fac == "" )
        and (words[5] == commod or commod == "" ) ):
      data_row.append( [int(words[0]),float(words[6])] )

  return data_row

def read_data(file_root, out_fac, in_fac, comods):
  case = [ 1, 2, 3 ]
#  method = [ '', '_M' ]
  method = [ '_M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]
  pu_contrib = []
  u_contrib = []
  
  for case_ in case:
    for method_ in method:
      pu_contrib_ = []
      u_contrib_ = []
      if ( case_ == 1 ):
        filename = file_root + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        pu_contrib_.append([read(filename, out_fac, in_fac, comods)])
        filename = file_root + str(case_) + method_ + '.trans.' + 'u' + str(8)
        u_contrib_.append([read(filename, out_fac, in_fac, comods)])
      else :
        for pu_ in pu:
          filename = file_root + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
          pu_contrib_.append([read(filename, out_fac, in_fac, comods)])
        for u_ in u:
          filename = file_root + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          u_contrib_.append([read(filename, out_fac, in_fac, comods)])
      filename = file_root + str(case_) + method_ + '.trans.' + 'pu'
      pu_contrib_.append([read(filename, out_fac, in_fac, comods)])
      filename = file_root + str(case_) + method_ + '.trans.' + 'u'
      u_contrib_.append([read(filename, out_fac, in_fac, comods)])
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib, u_contrib


def print_data(nuclide,filename,total,isotopic):
  
  case = [ 1, 2, 3 ]
#  method = [ 'W', 'M' ]
  method = [ 'M' ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]
  file = open(filename,"w")

  name = "Time "
  file.write(name)
  if (nuclide == 'pu'):
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
  elif (nuclide == 'u'):
    for case_ in case:
      for method_ in method:
        name = "1." + str(case_) + "-" + method_ + "-U-Total "
        file.write(name)
        if ( case_ == 1 ):
          name = "1." + str(case_) + "-" + method_ + "-U8 "
          file.write(name)
        else :
          for u_ in u:
            name = "1." + str(case_) + "-" + method_ + "-U" + str(u_) + " "
            file.write(name)
  else:
    print('OUPS!!!! what nuclide again ?!')


  file.write("\n")

  for i in range(len(total[0])):
    file.write( str(total[0][i][0]/12.) )
    file.write(" ")
    for j in range(len(total)):
      if ( len(total[j]) < i+1 ):
        file.write(str(0))
      else:
        file.write( str(total[j][i][1]) )
      file.write(" ")
      
      for k in range(len(isotopic[j])):
        if ( len(isotopic[j][k]) < i+1 ):
          file.write(str(0))
        else:
          file.write( str(isotopic[j][k][i][1]) )
        file.write(" ")
    file.write("\n")
  file.close()


def build_contrib(name,contrib,factor):
  u = contrib[1]
  pu = contrib[0]
  pu_contrib_relativ = []
  u_contrib_relativ = []
  total_pu = []
  total_u = []
 
  for case in pu:
    pu_contrib_ = []
    for contrib_ in case[0:-1]:
      pu_contrib_.append(contrib_[0])
      for i in range( len(pu_contrib_[-1]) ):
        pu_contrib_[-1][i][1] *= 1/case[-1][0][i][1]

    total_pu.append(case[-1][0])
    pu_contrib_relativ.append(pu_contrib_)
    for i in range( len(total_pu[-1]) ):
      total_pu[-1][i][1] *= factor
     
  for case in u:
    u_contrib_ = []
    for contrib_ in case[0:-1]: 
      u_contrib_.append(contrib_[0])
      for i in range( len(u_contrib_[-1]) ):
        u_contrib_[-1][i][1] *= 1/case[-1][0][i][1] 

    u_contrib_relativ.append(u_contrib_)
    total_u.append(case[-1][0])
    for i in range( len(total_u[-1]) ):
      total_u[-1][i][1] *= factor
    
  filename = name + '_pu.dat'
  print_data( 'pu', filename, total_pu, pu_contrib_relativ)
  
  filename = name + '_u.dat'
  print_data( 'u', filename, total_u, u_contrib_relativ)


def main():

  build_contrib('E3_second', read_data('data/EG29_Case.1.', '', 'PWR_fabrication', 'E3_second_stored' ), 0.001/0.9*0.3/1.5 )
  build_contrib('J1_second', read_data('data/EG29_Case.1.', '', 'PWR_fabrication', 'J1_second_stored' ), 0.001/0.9*0.3/1.5 )
  build_contrib('J1_prime', read_data('data/EG29_Case.1.', 'PWR_separation', '', 'J1_prime' ), 0.001/0.9*0.3/1.5 )


main()
