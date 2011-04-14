from __future__ import generators
import os

ROOT = 'patterns'

def main():
 for item in os.listdir(ROOT):
  path = os.path.join(ROOT, item)

  if os.path.isfile(path) and \
     ".gitignore" not in path:
   print 'Converting file %s to matrix' % path
   os.system('python convert.py %s' % path)

if __name__ == '__main__':
 main()
