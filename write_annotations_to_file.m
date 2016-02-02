function write_annotations_to_file( image_name, image_size , class_names, bboxes )

% This function carries out the process of writing annotations to a file 
%   Input: Please input a 2 x n with the class name and then the bounding
%   rect of the image found
%   
%   Make sure that the template.txt file and objecttemplate.txt is
%   included! Those include the template of the file that MATLAB will use
%   to output everything.

%image_name and size should be File Name, Image Size as X x Y x Color channels
%example: 'crop00001' [x y c]

template_text = fileread('template.txt');
objecttemplate_text = fileread('objecttemplate.txt');

%create output file we will be writing to
output_file_ID = fopen([image_name '.txt'], 'wt');

%printing out basic information
fprintf(output_file_ID, template_text, [image_name '.txt'], image_size); 

num_objects = size(bboxes);
num_objects = num_objects(1);
%class_names and bboxes should correspond 1 to 1
for i = 1:num_objects
    class = char(class_names{i});
    bbox = bboxes(i, :);
    fprintf(output_file_ID, objecttemplate_text, i, class, i, class, bbox);
end

%finish editing file
fclose(output_file_ID);


end

