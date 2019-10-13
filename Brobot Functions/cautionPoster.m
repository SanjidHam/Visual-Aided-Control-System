function [] = cautionPoster()

img = imread('caution.jpg'); 
xImage = [-1.19 -1.19; -1.19 -1.19];
yImage = [-1.125 -0.875; -1.125 -0.875];
zImage = [0.5 0.5; 0.25 0.25];
surf(xImage,yImage,zImage,'CData',img,'FaceColor','texturemap');

hold on;

end