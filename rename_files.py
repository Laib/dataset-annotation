from os import rename, listdir

STARTING_FILENAME = 1; 
starting_directory = '/home/wfu/data/wfuplate/JimCars/Temp'
fnames = listdir(starting_directory)

for fname in fnames:
    rename(starting_directory + '/' + fname, starting_directory + '/' + str(STARTING_FILENAME) + '.jpg')
    STARTING_FILENAME += 1









 
