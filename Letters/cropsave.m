function cropsave( image_filename )

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
     
     
     
end

close;
icrop = imcrop(i, bbox);
imwrite(icrop, [name '_crop' ext]);




end

