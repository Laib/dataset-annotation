from os import listdir
import os

starting_directory = '/home/wfu/data/wfuplate/JimCars/data/Images'
fnames = listdir(starting_directory)

newfile = open('train.txt', 'w')


for fname in fnames:
    name = os.path.splitext(fname)[0]
    newfile.write(name + '\n')

    

