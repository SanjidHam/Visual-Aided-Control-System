function [] = room()

%Walls
img = imread('grey.jpg'); 
xImage = [-1.2 -1.2; -1.2 -1.2];
yImage = [-1.2 1.2; -1.2 1.2];
zImage = [1 1; -0.6 -0.6];
surf(xImage,yImage,zImage,'CData',img,'FaceColor','texturemap');


img = imread('smartFactory.jpg'); 
xImage = [-1.2 1.2; -1.2 1.2];
yImage = [1.2 1.2; 1.2 1.2];
zImage = [1 1; -0.6 -0.6];
surf(xImage,yImage,zImage,'CData',img,'FaceColor','texturemap');

%Floor
img2 = imread('labFloor.jpg'); 
xImg = [1.2 -1.2; 1.2 -1.2];
yImg = [1.2 1.2; -1.2 -1.2];
zImg = [-0.6 -0.6; -0.6 -0.6];
surf(xImg,yImg,zImg,'CData',img2,'FaceColor','texturemap');

hold on;

end