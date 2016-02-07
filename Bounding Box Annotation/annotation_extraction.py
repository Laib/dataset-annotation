#!/usr/bin/env python


import os
import scipy
import numpy as np
import scipy.io as sio

"""
Load image and bounding boxes info from txt files of wfuplate database.
"""

_data_path = '/home/wfu/data/wfuplate/data'
num_classes = 2

filename = os.path.join(_data_path, 'Annotations', '01' + '.txt')
print 'Loading: {}'.format(filename)

with open(filename) as f:
    data = f.read()

import re
objs = re.findall('\(\d+, \d+\)[\s\-]+\(\d+, \d+\)', data)

num_objs = len(objs)

boxes = np.zeros((num_objs, 4), dtype=np.uint16)
gt_classes = np.zeros((num_objs), dtype=np.int32)
overlaps = np.zeros((num_objs, num_classes), dtype=np.float32)

# Load object bounding boxes into a data frame.
for ix, obj in enumerate(objs):
    # Make pixel indexes 0-based
    coor = re.findall('\d+', obj)
    x1 = float(coor[0])
    y1 = float(coor[1])
    x2 = float(coor[2])
    y2 = float(coor[3])
    cls = 1
    boxes[ix, :] = [x1, y1, x2, y2]
    gt_classes[ix] = cls
    overlaps[ix, cls] = 1.0

overlaps = scipy.sparse.csr_matrix(overlaps)

# return {'boxes' : boxes,
#        'gt_classes': gt_classes,
#        'gt_overlaps' : overlaps,
#        'flipped' : False}

print boxes
print gt_classes
print overlaps

