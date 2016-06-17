#!/usr/bin/env python

import numpy as np
import math
import sys

def readfile(filename):
  myfile = open(filename, 'r')
  data = myfile.readlines();
  data_row = []
  title_row = data[0].split()
  for line in data[1:]:
    words = line.split()
    data_row.append(words),
  return title_row,data_row


def m2y(data):
  lengh  = len(data)
  output = [ ]
 
  tmp = [ ]
  for u in range(len(data[0])):
    tmp.append(0)

  step = float(-1)
  for i in range(len(data)):
    if step < math.floor(float(data[i][0])) :
      if( step > -1 ) :
        output.append(np.copy(tmp))
        for u in range(len(data[0])):
          tmp[u] = 0 
      tmp[0] = math.floor(float(data[i][0]))
      step = tmp[0]
      for j in range(len(data[i][1:])):
        tmp[j+1] = float(data[i][j+1])
    else :
      for j in range(len(data[i][1:])):
        tmp[j+1] += float(data[i][j+1])
  return output      


def write_data(filename,title,data):

  myfile = open(filename, 'w')

  for wd in title:
    myfile.write(wd + " " )
  myfile.write("\n")

  for step in data:
    for val in step:
      myfile.write(str(val) + " ")
    myfile.write("\n")


def main():
  global timestep
  if len(sys.argv) != 3 :
    print("missing argument !!")
    quit()
  
  print(sys.argv[1])
  title,data = readfile(sys.argv[1])
  data_y = m2y(data)
  write_data(sys.argv[2],title,data_y)



main()
