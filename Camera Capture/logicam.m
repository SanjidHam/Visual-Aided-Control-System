%% Initialise cam
cam = webcam('c922');

%% Image Capture
cam.Resolution = '640x360';
img = snapshot(cam);
imshow(img);
% clear('cam');