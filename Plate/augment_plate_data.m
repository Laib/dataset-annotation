%enter the folder or image you want to work on
input_dir = '/Users/wfu/Dropbox/data/wfulicense/data';
output_dir = '/Users/wfu/Dropbox/data/wfulicense/data';
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
    [pathstr, name, ext] = fileparts(fullpath);
    
    i = imread(fullpath);
    
    %increase color saturation
    isat = saturate(i, 1.5);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'sat1');
    imwrite(isat, outputfilename);
    
    saturated_i = isat;
    
    %decrease color saturation
    isat = saturate(i, 0.5);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'sat2');
    imwrite(isat, outputfilename);
    
    %gaussfilter
    isat = imgaussfilt(i, 2);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'g1');
    imwrite(isat, outputfilename);
    
    %gaussfilter
    isat = imgaussfilt(i, 3);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'g2');
    imwrite(isat, outputfilename);
    
    %transformed, rotated 
    R = makeresampler({'cubic','nearest'},'replicate');
    
    %a = 0.15;
    %T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    %isat = imtransform(i,T,R);
    %outputfilename = sprintf('%s/%s_%s.png', output_dir, name, 'trans1');
    %imwrite(isat, outputfilename);
    
    a = 0.10;
    T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    isat = imtransform(i,T,R);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'trans2');
    imwrite(isat, outputfilename);
    
    
    %a = -0.15;
    %T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    %isat = imtransform(i,T,R);
    %outputfilename = sprintf('%s/%s_%s.png', output_dir, name, 'trans3');
    %imwrite(isat, outputfilename);
    
    
    a = -0.10;
    T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    isat = imtransform(i,T,R);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'trans4');
    imwrite(isat, outputfilename);
    
    
    
    %transformed, rotated 
    R = makeresampler({'cubic','nearest'},'replicate');
    
    %a = 0.15;
    %T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    %isat = imtransform(saturated_i,T,R);
    %outputfilename = sprintf('%s/%s_%s.png', output_dir, name, 'strans1');
    %imwrite(isat, outputfilename);
    
    a = 0.10;
    T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    isat = imtransform(saturated_i,T,R);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'strans2');
    imwrite(isat, outputfilename);
    
    
    %a = -0.15;
    %T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    %isat = imtransform(saturated_i,T,R);
    %outputfilename = sprintf('%s/%s_%s.png', output_dir, name, 'strans3');
    %imwrite(isat, outputfilename);
    
    
    a = -0.10;
    T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
    isat = imtransform(saturated_i,T,R);
    outputfilename = sprintf('%s/%s_%s.jpg', output_dir, name, 'strans4');
    imwrite(isat, outputfilename);
end