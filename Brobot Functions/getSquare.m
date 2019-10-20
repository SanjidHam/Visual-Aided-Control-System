function [gotSquare] = getSquare(rgb)
I = rgb
Ibw = ~im2bw(I,graythresh(I));
Ifill = imfill(Ibw,'holes');

Iarea = bwareaopen(Ifill,250);

Ifinal = bwlabel(Iarea);
stat = regionprops(Ifinal,'boundingbox');
imshow(I); hold on;
for cnt = 1 : numel(stat)
    bb = stat(cnt).BoundingBox;
    rectangle('position',bb,'edgecolor','r','linewidth',2);
end
gotSquare=1;
end

