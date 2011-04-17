# -*- coding: iso-8859-1 -*-
import Image
import sys
import random

def generate():
 random.seed(1337)
 func = get_value_random
 func_name = ""

 if "inverse" == sys.argv[1]:
  func = get_value_inverse
  func_name = "inverse"
 else:
  func = get_value_random
  func_name = "noise"

 path = sys.argv[2]
 name = path.split("/")[-1].split(".")[0]

 for porcentage in range(10, 101, 10): 
  origin = Image.open(path)
  dest = Image.new('RGB', (64, 64), "black")

  pixels_origin = origin.load()
  pixels_dest = dest.load()

  for i in xrange(dest.size[1]):
   for j in xrange(dest.size[0]):
    if random.randint(0, 100) <= porcentage:
     pixels_dest[j, i] = func(pixels_origin[j,i], True)
    else:
     pixels_dest[j, i] = func(pixels_origin[j,i], False)

  dest.save("%s_%s_%s.png" % (name, func_name, str(porcentage)))

def get_value_random(v, noise):

 if not noise:
  return v

 return random.sample([(0, 0, 0, 255), (255,255,255, 255)], 1)[0]
 

def get_value_inverse(v, noise):

 if not noise:
  return v

 if (0, 0, 0, 255) == v:
  return (255,255,255, 255)
 else:
  return (0, 0, 0, 255)

if __name__ == '__main__':
 generate()