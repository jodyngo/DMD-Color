clc; clear all; close all;

Frames = zeros(120, 160, 100);
myFolder = 'F:\Resources Video\dataset2014\dataset\baseline\highway\cut';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);

for k = 1:length(jpegFiles)
    baseFileName = jpegFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    imageArray = imread(fullFileName);
    imageArrayResized = imresize(imageArray, [120 160]);
    Frames(:,:,k) = imageArrayResized(:,:,1);
end

sizeOfFrames = size(Frames);
assert(length(sizeOfFrames) == 3, 'Input must be a three dimensional matrix')
heightFrame = sizeOfFrames(1);
widthFrame = sizeOfFrames(2); 
numberFrames = sizeOfFrames(3);
FramesVectorized = zeros(heightFrame * widthFrame, numberFrames);

for i=1:numberFrames
    temp = Frames(:,:,i);
    FramesVectorized(:, i)= temp(:); 
    
end
X = FramesVectorized(:,1:numberFrames);
save('video.mat','X');

X1 = FramesVectorized(:,1:numberFrames-1);
X2 = FramesVectorized(:,2:numberFrames);
