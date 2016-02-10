%enter the folder or image you want to work on
input_dir = '/home/wfu/Dropbox/Car Images/Google Images';
working_dir = dir (input_dir);

%need to go to the folder holding image files 
%cd(input_dir);

%stored as a 1xN cell array
allNames = {working_dir.name};

picture_paths = {};
picture_fullpaths = {};


%uses allnames, 2 because allNames is a 1xN cell array
for i = 1:size(allNames, 2)
    filename = char(allNames{i});
    [pathstr, name, ext] = fileparts(filename);
   
    if strcmp(ext, '.png') || strcmp(ext, '.jpg') || strcmp(ext, '.JPG')
        picture_paths = [picture_paths; {[ '/' filename]}];
    end
  
end

%picture_paths is a Nx1 array
for i = 1:size(picture_paths, 1)
    filename = char(picture_paths{i});
    filename = [input_dir filename];
    picture_fullpaths = [picture_fullpaths; {filename}];
end


for i = 1:size(picture_fullpaths, 1)
    fullpath = char(picture_fullpaths{i});
    %cropsave(fullpath);
    categorize_save(fullpath);
end

