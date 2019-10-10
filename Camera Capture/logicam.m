%% Initialise cam
cam = webcam(2);

%% Image Capture
cam.Resolution = '640x360';
img = snapshot(cam);
imshow(img);
% clear('cam');