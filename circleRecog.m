% function [] = circleRecog(r)
% rgb = r;
% rgb = imread('circle_SL.jpg');
% idisp(rgb)
% % rgb = imcrop(I,[1220 500 500]); %[initial u ,initial v,Length, width] %Image crop
% 
% gray_image = rgb2gray(rgb);
% imshow(gray_image)
% 
% [~,~] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
%     'Sensitivity',0.9);
% idisp(rgb)
% h = viscircles(centers,radii);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
%     'Sensitivity',0.92);
% 
% length(centers)
% delete(h)  % Delete previously drawn circles
% h = viscircles(centers,radii);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
%           'Sensitivity',0.92,'Method','twostage');
% 
% delete(h)
% h = viscircles(centers,radii);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
%           'Sensitivity',0.95);
% 
% delete(h)
% viscircles(centers,radii);
% end
% 