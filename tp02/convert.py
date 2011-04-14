#! /usr/bin/python
import sys
import Image

def convert():
 path = sys.argv[1]
 im = Image.open(path)
 name = path.split("/")[-1].split(".")[0]
 data = im.getdata()
 fin = open("data/"+name+".txt","w")
 for t in data:
  r = t[0]
  bool = -1 if r == 0 else 1
  fin.write(str(bool)+"\n")
 fin.close()

if __name__ == '__main__':
 convert()
