function get_roi_from_file( image_filename )

%GET_ROI_FROM_FILE Summary of this function goes here
%   Detailed explanation goes here

[pathstr, name, ext] = fileparts(image_filename);
i = imread(image_filename);
figure;
imshow(i);

stillCutting = true;

class_list = {};
bboxes = [];

while stillCutting
    
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
     
     % Clears everything if you want to start over
     if strcmp(x, 'clear')
         class_list = {};
         bboxes = [];
         continue;
     end
     
     class_list = [class_list; {x}];
     
     bbox(1) = int64(bbox(1));
     bbox(2) = int64(bbox(2));
     bbox(3) = int64(bbox(3));
     bbox(4) = int64(bbox(4));
     
     
     bbox(3) = bbox(3) + bbox(1);
     bbox(4) = bbox(4) + bbox(2);
     bboxes = [bboxes; bbox];
     
end

close;
write_annotations_to_file(name, size(i), class_list, bboxes); 

end

