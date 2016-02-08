import os.path
import sys
from os import listdir
import shutil
import glob


def get_filename(path):
    """ Gets a filename (without extension) from a provided path """

    filename = path.split('/')[-1].split('.')[0]
    return filename

fnames = glob.glob('/home/wfu/data/wfuletters/data/*.png')

for fname in fnames:

    name = get_filename(fname)
    number = int(name[2])

    if number >= 7: #move to testing folder
        old_dir = fname
        new_dir = os.path.join('/home/wfu/data/wfuletters/data/test',
                               name + '.png')
        shutil.move(old_dir, new_dir)

    else: # move to training folder
        old_dir = fname
        new_dir = os.path.join('/home/wfu/data/wfuletters/data/train',
                               name + '.png')
        shutil.move(old_dir, new_dir)




