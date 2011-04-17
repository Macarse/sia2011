from __future__ import generators
import os

MEMORIZE_PATTERNS = 'patterns'
TEST_PATTERNS = 'test_patterns'
DATA = 'data'

GET_PATTERNS_TO_MEMORIZE_CODE = """
function ret = get_patterns_to_memorize()
    ret = {};
    ret.names = {
%s
    };
    ret.values = [
%s
            ];

end
"""

GET_PATTERNS_TO_TEST_CODE = """
function ret = get_patterns_to_test()
    ret = {};
    ret.names = {
%s
    };
    ret.values = [
%s
    ];
end
"""

LOAD_TEMPLATE = """           load('%s')';\n"""
NAME_TEMPLATE = """           '%s';\n"""

def conversion(path):
 print 'Converting file %s to matrix' % path
 os.system('python convert.py %s' % path)

def dump_image(name):
 print 'Converting data %s to image' % name
 os.system('python out2png.py %s' % name)




def main():
 load_list = ""
 load_list_names = ""
 load_list_test = ""
 load_list_test_names = ""

 memorize_patterns = os.listdir(MEMORIZE_PATTERNS)
 test_patterns = os.listdir(TEST_PATTERNS)

 for item in set(memorize_patterns+test_patterns):
  path = os.path.join(MEMORIZE_PATTERNS if item in memorize_patterns else TEST_PATTERNS, item)
  name = item.split(".")[0]

  if not path.endswith(".png") or \
       not os.path.isfile(path):
      continue

  # convert images to octave data files

  conversion(path)

  # inject data objects in octave get_pattern scripts
  load_element = LOAD_TEMPLATE % (os.path.join(DATA, name+".txt"))
  load_element_name = NAME_TEMPLATE % name
  if item in memorize_patterns and load_element not in load_list:
   load_list += load_element
   load_list_names += load_element_name
  if item in test_patterns and load_element not in load_list_test:
   load_list_test += load_element
   load_list_test_names += load_element_name

 # write patterns to memorize in octave script 
 gptm_file = open("get_patterns_to_memorize.m", "w")
 gptm_file.write(GET_PATTERNS_TO_MEMORIZE_CODE % (load_list_names, load_list))
 gptm_file.close()
 print "get_patterns_to_memorize.m file written"
 
 # write patterns to test in octave script 
 gptt_file = open("get_patterns_to_test.m", "w")
 gptt_file.write(GET_PATTERNS_TO_TEST_CODE % (load_list_test_names, load_list_test))
 gptt_file.close()
 print "get_patterns_to_test.m file written"
 
 # HERE WE SHOULD RUN main.m in octave!
 print "running octave scripted main"
 os.system('./scripted_main')
 
 # convert data output from octave to images
 for item in [item for item in test_patterns if item.endswith(".png")]:
  path = os.path.join(TEST_PATTERNS, item)
  name = item.split(".")[0]

  if not path.endswith(".png") or \
       not os.path.isfile(path):
      continue

  dump_image(item.replace(".png", ""))
  

if __name__ == '__main__':
 main()
