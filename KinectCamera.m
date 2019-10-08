%% View Image
clear all;
colorDevice = imaq.VideoDevice('kinect',1);
depthDevice = imaq.VideoDevice('kinect',2);
  
colorDevice();
depthDevice();
  
colorImage = colorDevice();
depthImage = depthDevice();
  
ptCloud = pcfromkinect(depthDevice, depthImage, colorImage);

release(colorDevice);
release(depthDevice);
idisp(colorImage);


%% Circle detection
% I = colorImage;
rgb = imread('coloredChips.png');
% rgb = imread('c.jpg');
idisp(rgb)
% rgb = imcrop(I,[1220 500 500]); %[initial u ,initial v,Length, width] %Image crop

gray_image = rgb2gray(rgb);
imshow(gray_image)

[~,~] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');
[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.9);
imshow(rgb)
h = viscircles(centers,radii);

[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.92);

length(centers)
delete(h)  % Delete previously drawn circles
h = viscircles(centers,radii);

[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
          'Sensitivity',0.92,'Method','twostage');

delete(h)
h = viscircles(centers,radii);

[centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
          'Sensitivity',0.95);

delete(h)
viscircles(centers,radii);
% imshow(gray_image)
% 
% [centersBright,radiiBright] = imfindcircles(rgb,[20 25], ...
%     'ObjectPolarity','bright','Sensitivity',0.92);
% 
% imshow(rgb)
% 
% hBright = viscircles(centersBright, radiiBright,'Color','b');
% 
% [centersBright,radiiBright,metricBright] = imfindcircles(rgb,[20 25], ...
%     'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
% 
% delete(hBright)
% hBright = viscircles(centersBright, radiiBright,'Color','b');
% 
% h = viscircles(centers,radii);

% %% Square Recognition
% 
% Ibw = ~im2bw(I,graythresh(I));
% Ifill = imfill(Ibw,'holes');
% Iarea = bwareaopen(Ifill,100);
% Ifinal = bwlabel(Iarea);
% stat = regionprops(Ifinal,'boundingbox');
% imshow(I); hold on;
% for cnt = 1 : numel(stat)
%     bb = stat(cnt).BoundingBox;
%     rectangle('position',bb,'edgecolor','r','linewidth',2);
% end