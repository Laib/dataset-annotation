import os.path
import sys
from os import listdir
import shutil
import glob


def get_filename(path):
    """ Gets a filename (without extension) from a provided path """

    filename = path.split('/')[-1].split('.')[0]
    return filename


fnames = glob.glob('/home/wfu/data/wfuletters/data/test/*.png')
newfile = open('/home/wfu/data/wfuletters/data/test.txt', 'w')

for fname in fnames:

    name = get_filename(fname)
    firstchar = name[0]

    class_name = 0

    if firstchar == '0' or \
       firstchar == '1' or \
       firstchar == '2' or \
       firstchar == '3' or \
       firstchar == '4' or \
       firstchar == '5' or \
       firstchar == '6' or \
       firstchar == '7' or \
       firstchar == '8' or \
       firstchar == '9':

        class_name = int(firstchar)

    else: # ord('a') = 97

        class_name = ord(firstchar) - 87

    newfile.write(name + '.png' + ' ' + str(class_name) + '\n')



