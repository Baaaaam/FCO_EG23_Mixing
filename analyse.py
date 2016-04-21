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
  u  = [ 5,8 ]
  for case_ in case:
    for method_ in method:

      if (case_ == 1 ):
        filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(9)
        read(filename)
        filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(8)
        read(filename)
      else :
        for pu_ in pu:
          filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'pu' + str(pu_)
          read(filename)
        for u_ in u:
          filename = 'EG29_Case.1.' + str(case_) + method_ + '.trans.' + 'u' + str(u_)
          read(filename)


def main():
  read_data()


main()