#!/usr/bin/env python
import numpy as np

def readfile_transaction(filename, out_fac, in_fac, commod):
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

def readfile_inv(filename):
  my_file = open(filename, 'r')
  data = my_file.readlines()
  data_row = []
  for line in data[1:]:
    words = line.split()
    data_row.append( [int(words[0]),float(words[1])] )
  return data_row

def read_transaction(file_root, out_fac, in_fac, comods, method, Am = False):
  case = [ 1, 2, 3 ]
  pu = [ 8,9,10,11,12 ]
  if Am:
    pu.append(13)
  u  = [ 8 ]
  pu_contrib = []
  u_contrib = []
  
  for case_ in case:
    for method_ in method:
      pu_contrib_ = []
      u_contrib_ = []
      if ( case_ == 1 ):
        filename = file_root + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        pu_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
        filename = file_root + str(case_) + method_ + '.trans.' + 'u' + str(8)
        u_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
      else :
        for pu_ in pu:
          if pu_ < 13 :
            filename = file_root + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
            pu_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
          else:
            filename = file_root + str(case_) + method_ + '.trans.' + 'am' + str(11)
            pu_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
        for u_ in u:
          filename = file_root + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          u_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
      filename = file_root + str(case_) + method_ + '.trans.' + 'pu'
      pu_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
      filename = file_root + str(case_) + method_ + '.trans.' + 'u'
      u_contrib_.append([readfile_transaction(filename, out_fac, in_fac, comods)])
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib, u_contrib


def read_inv(file_root, method, Am = False):
  case = [ 1, 2, 3 ]
  pu = [ 8,9,10,11,12 ]
  if Am:
    pu.append(13)
  u  = [ 8 ]
  pu_contrib = []
  u_contrib = []
  
  for case_ in case:
    for method_ in method:
      pu_contrib_ = []
      u_contrib_ = []
      if ( case_ == 1 ):
        filename = file_root + str(case_) + method_ + '.inv.' + 'pu' + str(9)
        pu_contrib_.append([readfile_inv(filename)])
        filename = file_root + str(case_) + method_ + '.inv.' + 'u' + str(8)
        u_contrib_.append([readfile_inv(filename)])
      else :
        for pu_ in pu:
          if pu_ < 13 :
            filename = file_root + str(case_) + method_ + '.inv.' + 'pu' + str(pu_)
            pu_contrib_.append([readfile_inv(filename)])
          else:
            filename = file_root + str(case_) + method_ + '.inv.' + 'am' + str(11)
            pu_contrib_.append([readfile_inv(filename)])
        for u_ in u:
          filename = file_root + str(case_) + method_ + '.inv.' + 'u' + str(u_)
          u_contrib_.append([readfile_inv(filename)])
      filename = file_root + str(case_) + method_ + '.inv.' + 'pu'
      pu_contrib_.append([readfile_inv(filename)])
      filename = file_root + str(case_) + method_ + '.inv.' + 'u'
      u_contrib_.append([readfile_inv(filename)])
      pu_contrib.append(pu_contrib_)
      u_contrib.append(u_contrib_)
  return pu_contrib, u_contrib


def build_contrib(name,contrib,factor, method, Am = False):
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
        if (case[-1][0][i][1] != 0):
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
        if (case[-1][0][i][1] != 0):
          u_contrib_[-1][i][1] *= 1/case[-1][0][i][1] 

    u_contrib_relativ.append(u_contrib_)
    total_u.append(case[-1][0])
    for i in range( len(total_u[-1]) ):
      total_u[-1][i][1] *= factor
    
  filename = name + '_pu.dat'
  print_data_inv( 'pu', filename, total_pu, pu_contrib_relativ, method, Am)
  
  filename = name + '_u.dat'
  print_data_inv( 'u', filename, total_u, u_contrib_relativ, method)



def print_data_inv(nuclide,filename,total,isotopic, method, Am = False):
  
  case = [ 1, 2, 3 ]
  pu = [ 8,9,10,11,12 ]
  u  = [ 8 ]

  p = 0
  if (nuclide == 'pu'):
    for c in range(len(case)):
      for m in range(len(method)):
        filename_ = "processed_data/" + str(case[c]) + "_" + method[m] + "_" + filename
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
        if Am:
          name = str(case[c]) + "-" + method[m] + "-" + "Am" + str(11) + " "
          file.write(name)

        file.write("\n")

        for i in range(len(total[p])):
          file.write( str(total[p][i][0]/12.) )
          file.write(" ")
          file.write( str(total[p][i][1]) )
          file.write(" ")
      
          for k in range(len(isotopic[p])):
            if i<len(isotopic[p][k]):
              file.write( str(isotopic[p][k][i][1]) )
            else:
              file.write(str(0))
            file.write(" ")
          file.write("\n")
        file.close()
        p += 1

  elif (nuclide == 'u'):
    for c in range(len(case)):
      for m in range(len(method)):
        filename_ = "processed_data/" + str(case[c]) + "_" + method[m] + "_" + filename
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

  method_r = [ '_', '_MF' ]
  method = [ 'W', 'M' ]
  build_contrib('E3_second', read_transaction('data/EG29_Case.1.', '', 'PWR_fabrication', 'E3_second_stored', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  build_contrib('J1_second', read_transaction('data/EG29_Case.1.', '', 'PWR_fabrication', 'J1_second_stored', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  build_contrib('J1_prime', read_transaction('data/eg29_case.1.', 'PWR_separation', '', 'J1_prime', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )

  method_r = [ '_', '_MF', '_MLP', '_MLP-STD', '_MLP-STD-2', '_MLP_STD_recipe_','_pucomp_'   ]
  method = [ 'W', 'M', 'MLP', 'MLP-STD', 'MLP-STD-2', 'MLP-STD-recipe','pucomp' ]
  build_contrib('MOX_fuel', read_transaction('data/EG29_Case.1.', 'PWR_fabrication', '', 'PWR_MOX_new', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  
  build_contrib('LWR_OUT', read_transaction('data/EG29_Case.1.', '', 'PWR_cooling', 'PWR_MOX_spent', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )

  method_r = [ '_MLP', '_MLP-STD', '_MLP-STD-2','_MLP_STD_recipe_','_pucomp_'  ]
  method = [   'MLP', 'MLP-STD', 'MLP-STD-2','MLP-STD-recipe','pucomp' ]
  build_contrib('J1_STR', read_inv('data/EG29_Case.1.', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )


  method_r = [ '_', '_LII_x2_', '_LII_x5_', '_LII_x10_'  ]
  method = [ 'W', 'W-LII-x2', 'W-LII-x5', 'W-LII-x10' ]
  build_contrib('MOX_fuel', read_transaction('data/EG29_Case.1.', 'PWR_fabrication', '', 'PWR_MOX_new', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  build_contrib('E3_second', read_transaction('data/EG29_Case.1.', '', 'PWR_fabrication', 'E3_second_stored', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  build_contrib('J1_second', read_transaction('data/EG29_Case.1.', '', 'PWR_fabrication', 'J1_second_stored', method_r, True  ), 0.001/0.9*0.3/1.5, method, True  )
  build_contrib('J1_STR', read_inv('data/EG29_Case.1.', method_r, True ), 0.001, method, True )
main()
