import os.path
import sys
from os import listdir
import shutil
import glob
import cv2

input_dir = '/home/wfu/data/wfuletters/data/*.png'
output_dir = ''


def label_files(input_dir):

    fnames = glob.glob(input_dir + '/train' + '/*.jpg')
    newfile = open(input_dir + '/train.txt', 'w')

    for fname in fnames:

        name = get_filename(fname)
        firstchar = name.split('_')[0]

        class_name = 0

        if firstchar == 'bkgd':
            class_name = 0
        elif firstchar == 'plate':
            class_name = 1
        elif firstchar == 'light':
            class_name = 2

        newfile.write(name + '.jpg' + ' ' + str(class_name) + '\n')

def resize_files(path, width, height):

    ext = '.jpg'
    fnames = glob.glob(path + '/*' + ext)

    for fname in fnames:
        i = cv2.imread(fname)
        i = cv2.resize(i, (width, height), interpolation=cv2.INTER_CUBIC)
        cv2.imwrite(fname, i)



def rename_files_to_integers(path, classifier):

    ext = '.jpg'
    fnames = glob.glob(path + '/*' + ext)

    counter = 1
    for fname in fnames:
        head, _  = os.path.split(fname)
        newtail = '{}_{}'.format(classifier, str(counter) + ext)
        newfilename = os.path.join(head,newtail)
        os.rename(fname, newfilename)
        counter += 1


def get_filename(path):
    """ Gets a filename (without extension) from a provided path """

    filename = path.split('/')[-1].split('.')[0]
    return filename


def split_train_test(input_dir):
    fnames = glob.glob(input_dir + '/*.jpg')

    for fname in fnames:

        name = get_filename(fname)
        number = int(name.split('_')[1])
        if number >= 70: #move to testing folder
            old_dir = fname
            new_dir = os.path.join(input_dir, 'test',
                                   name + '.jpg')
            shutil.move(old_dir, new_dir)

        else: # move to training folder
            old_dir = fname
            new_dir = os.path.join(input_dir, 'train',
                                   name + '.jpg')
            shutil.move(old_dir, new_dir)

"""
classifier = 'plate'
input_dir = '/Users/wfu/Dropbox/data/wfulicense/unprocessed/plate'
rename_files_to_integers(input_dir, classifier)
"""

input_dir = '/Users/wfu/Dropbox/data/wfulicense/data'
# resize_files(input_dir, 100, 50)
#split_train_test(input_dir)
label_files(input_dir)
