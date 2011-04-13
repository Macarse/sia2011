#! /usr/bin/python

import Image

name = "line4"

im = Image.open("images/"+name+".png")
data = im.getdata()
fin = open("data/"+name+".txt","w")
for t in data:
	r = t[0]
	bool = -1 if r == 0 else 1
	fin.write(str(bool)+"\n")
fin.close()
