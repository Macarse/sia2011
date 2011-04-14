from __future__ import generators
import os

PATTERNS = 'patterns'
DATA = 'data'

GET_PATTERNS_TO_MEMORIZE_CODE = """
function ret = get_patterns_to_memorize()

    ret = [
%s
            ];

end
"""

LOAD_TEMPLATE = """           load('%s')';\n"""


def conversion(path):
 if os.path.isfile(path):
  print 'Converting file %s to matrix' % path
  os.system('python convert.py %s' % path)


def main():
 load_list = ""
 for item in os.listdir(PATTERNS):
  path = os.path.join(PATTERNS, item)
  if ".gitignore" in path:
      continue
  
  # convert images to octave data files
  conversion(path)
  
  # inject data objects in octave get_pattern scripts
  load_list += LOAD_TEMPLATE % (os.path.join(DATA, item.split(".")[0]+".txt"))
  
 gptm_file = open("get_patterns_to_memorize.m", "w")
 gptm_file.write(GET_PATTERNS_TO_MEMORIZE_CODE % load_list)
 gptm_file.close()

if __name__ == '__main__':
 main()
