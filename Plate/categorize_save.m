function categorize_save( image_filename )

%GET_ROI_FROM_FILE Summary of this function goes here
%   Detailed explanation goes here

output_dir = '/home/wfu/data/wfuletters/data';
identifier = 'orig';

[pathstr, name, ext] = fileparts(image_filename);
i = imread(image_filename);
figure;
imshow(i);

stillCutting = true;

class_list = {};
bboxes = [];

%use this variable to prevent overwriting when 2 of same category in 1
%image
counter = 0;
while stillCutting
    
     counter = counter + 1;
     
     bbox = getrect;
     x = inputdlg('end: redo: Enter classifier name');
     
     % When the user is done with identification
     if strcmp(x, 'end')
         break;
     end
     
     % If you wish to redo box drawn
     if strcmp(x, 'redo')
         continue;
     end
     
     
     icrop = imcrop(i, bbox);
     output_filename = sprintf('%s/%s/%s_%s_%d.jpg',output_dir, x{1}, x{1}, name, counter)
     imwrite(icrop, output_filename);
end

close;

end

