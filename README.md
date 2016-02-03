# dataset-annotation

MATLAB script for annotation image files to create datasets for training. 

# How to use

Run the "annotate.m" file and supply the folder that you want to work in.
The annotations should be saved in ../Annotations/your-file-name.txt

To make the code fit your dataset, simple modify the files for template.txt
and objecttemplate.txt. The template.txt is for the header file, and then 
the objecttemplate.txt part is generated for each object detected in the image.
