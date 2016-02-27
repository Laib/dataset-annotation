from os import rename, listdir
import os, sys
import glob
import shutil
import cv2



def convert_paths_to_fullpath(base_path, short_paths):

    full_paths = []
    for short_path in short_paths:
        short_path = os.path.join(base_path, short_path)
        full_paths.append(short_path)

    return full_paths

def convert_fullpath_to_paths(base_path, full_paths):

    short_paths = []
    for fp in full_paths:
        short_path = os.path.relpath(fp, base_path)
        short_paths.append(short_path)

    return short_paths

def write_folder_to_file(base_dir, output_dir, fulldir = False):

    out = file(os.path.join(output_dir, 'names.txt'), 'w')
    filenames = glob.glob(base_dir + '/*')

    for filename in filenames:
        if fulldir:
            out.write(filename)
            out.write('\n')
        else:
            fname = os.path.basename(filename)
            out.write(fname)
            out.write('\n')

    out.close()

def retrieve_folder_from_file(file):
    fc = open(file, 'r')
    fnames = fc.readlines()

    return fnames

def write_annotations_to_file(fnames, bboxes, output_dir):

    for i in xrange(len(fnames)):
        fname = fnames[i]
        bbox = bboxes[i]

        fileout = file(os.path.join(output_dir, fname + '.txt'), 'w')
        fileout.write('{} {} {} {}', str(bbox[0]), str(bbox[1]), str(bbox[2]), str(bbox[3]))
        fileout.close()





def resize_images(fnames, output_dir, x, y):

    for i in xrange(len(fnames)):
        fname = fnames[i]

        i = cv2.imread(fname)
        i = cv2.resize(i, (x, y), interpolation=cv2.INTER_CUBIC)
        output_file = os.path.join(output_dir, os.path.basename(fname))
        cv2.imwrite(output_file, i)


















 
