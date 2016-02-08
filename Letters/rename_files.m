start_dir = '/home/wfu/data/wfuletters/raws/data';
output_dir = '/home/wfu/data/wfuletters/data';

folders = dir(start_dir);
dirFlags = [folders.isdir];

subFolders = folders(dirFlags);
%removing directories . and ..
subFolders(1:2) = [];

for k = 1 : length(subFolders)
    
    foldername = subFolders(k).name;
    class_folder = sprintf('%s/%s', start_dir, foldername);
    
    
    image_dir = dir (class_folder);

    %stored as a 1xN cell array
    allNames = {image_dir.name};

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
        filename = [class_folder '/' filename];
        picture_fullpaths = [picture_fullpaths; {filename}];
    end

    %counter for naming files
    counter = 0;
    for i = 1:size(picture_fullpaths, 1)
        
        if (counter >= 10)
            break;
        end
        
        fullpath = char(picture_fullpaths{i});
        i = imread(fullpath);
        i = imresize(i, [50 30]);
        
        newfilename = sprintf('%s/%s_%d.png', output_dir, foldername, counter);
        imwrite(i, newfilename);
        counter = counter + 1;
    end
    
end