# -*- coding: iso-8859-1 -*-
import Image
import sys


def out2png():
 name = sys.argv[1]
 v = [int(i.strip()) for i in open('output/'+name+".txt")]

 img = Image.new('RGB', (64, 64), "black")
 pixels = img.load()
 for i in xrange(img.size[1]):
  for j in xrange(img.size[0]):
   pixels[j, i] = get_value(v[i*img.size[0]+j])

 #img.show()
 img.save('output_img/'+name+".png")

def get_value(v):
 if v == -1:
  return (0,0,0)
 else:
  return (255,255,255)

if __name__ == '__main__':
 out2png()