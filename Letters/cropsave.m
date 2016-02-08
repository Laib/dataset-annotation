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

skip = false;

while stillCutting
    
     bbox = getrect;
     
     
     % Construct a questdlg with three options
    choice = questdlg('Choose an option?', ...
	'U M R', ...
	'Proceed','Redo','Skip', 'Proceed');


    choice
    % Handle response
    if strcmp(choice, 'Proceed')
        choice
        break;
    end
    
    if strcmp(choice, 'Redo')
        choice
        continue;
    end
    
    if strcmp(choice, 'Skip')
        choice
        skip = true;
        break;
    end
end
     
close;

if skip == false
    icrop = imcrop(i, bbox);
    imwrite(icrop, [name '_crop' ext]);
end



end

