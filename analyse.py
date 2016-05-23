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

def read_data(file_root, out_fac, in_fac, comods, method):
  case = [ 1, 2, 3 ]
#  case = [ 3 ]
#  method = [ '_M' ]
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


def print_data(nuclide,filename,total,isotopic, method):
  
  case = [ 1, 2, 3 ]
#  case = [ 3 ]
#  method = [ 'M' ]
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


def build_contrib(name,contrib,factor, method):
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
  print_data_ind( 'pu', filename, total_pu, pu_contrib_relativ, method)
  
  filename = name + '_u.dat'
  print_data_ind( 'u', filename, total_u, u_contrib_relativ, method)



def print_data_ind(nuclide,filename,total,isotopic, method):
  
  case = [ 1, 2, 3 ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]

  p = 0
  if (nuclide == 'pu'):
    for c in range(len(case)):
      for m in range(len(method)):
        filename_ = str(case[c]) + "_" + method[m] + "_" + filename
        print(filename_)
        file = open(filename_,"w")
        name = "Time "
        file.write(name)
        name = str(case[c]) + "-" + method[m] + "-" + "Pu-Total "
        file.write(name)
        if ( case[c] == 1 ):
          name = str(case[c]) + "-" + method[m] + "-" + "Pu9 "
          file.write(name)
        else :
          for pu_ in pu:
            name = str(case[c]) + "-" + method[m] + "-" + "Pu" + str(pu_) + " "
            file.write(name)

        file.write("\n")

        for i in range(len(total[p])):
          file.write( str(total[p][i][0]/12.) )
          file.write(" ")
          file.write( str(total[p][i][1]) )
          file.write(" ")
      
          for k in range(len(isotopic[p])):
            file.write( str(isotopic[p][k][i][1]) )
            file.write(" ")
          file.write("\n")
        file.close()
        p += 1

  elif (nuclide == 'u'):
    for c in range(len(case)):
      for m in range(len(method)):
        filename_ = str(case[c]) + "_" + method[m] + "_" + filename
        file = open(filename_,"w")
        name = "Time "
        file.write(name)
        name = str(case[c]) + "-" + method[m] + "-" + "U-Total "
        file.write(name)
        if ( case[c] == 1 ):
          name = str(case[c]) + "-" + method[m] + "-" + "U8 "
          file.write(name)
        else :
          for u_ in u:
            name = str(case[c]) + "-" + method[m] + "-" + "U" + str(u_) + " "
            file.write(name)

              
        file.write("\n")

        for i in range(len(total[p])):
          file.write( str(total[p][i][0]/12.) )
          file.write(" ")
          file.write( str(total[p][i][1]) )
          file.write(" ")
      
          for k in range(len(isotopic[p])):
            file.write( str(isotopic[p][k][i][1]) )
            file.write(" ")
          file.write("\n")
        file.close()
        p += 1
  else:
    print('OUPS!!!! what nuclide again ?!')


  

def main():

  method_r = [ '', '_M' ]
  method = [ 'W', 'M' ]
  build_contrib('E3_second', read_data('data/EG29_Case.1.', '', 'PWR_fabrication', 'E3_second_stored', method_r ), 0.001/0.9*0.3/1.5, method )
  build_contrib('J1_second', read_data('data/EG29_Case.1.', '', 'PWR_fabrication', 'J1_second_stored', method_r ), 0.001/0.9*0.3/1.5, method )
  build_contrib('J1_prime', read_data('data/eg29_case.1.', 'PWR_separation', '', 'J1_prime', method_r ), 0.001/0.9*0.3/1.5, method )

  method_r = [ '', '_M', '_MLP', '_MLP-STD', '_MLP-STD-2'  ]
  method = [ 'W', 'M', 'MLP', 'MLP-STD', 'MLP-STD-2' ]
  build_contrib('MOX_fuel', read_data('data/EG29_Case.1.', 'PWR_fabrication', '', 'PWR_MOX_new', method_r ), 0.001/0.9*0.3/1.5, method )
  
  build_contrib('LWR_OUT', read_data('data/EG29_Case.1.', '', 'PWR_cooling', 'PWR_MOX_spent', method_r ), 0.001/0.9*0.3/1.5, method )
#/6.58063000
  #  build_contrib('test', read_data('data/EG29_Case.1.', '', 'PWR_fabrication', 'J1_second_stored' ), 1 )

main()
