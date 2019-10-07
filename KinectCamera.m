%% Setup Kinect v1.6 Runtime
targetinstaller

%% Kinect adaptor and devices
info = imaqhwinfo('kinect')

%% Create videoinput object for colour stream
info.DeviceInfo(1)
colorVid = videoinput('kinect',1,'RGB_640x360');
preview(colorVid);

%% Videoinput object for depth stream
info.DeviceInfo(2)
depthVid = videoinput ('kinect',2,'Depth_640x480');

depthImage = getsnapshot(depthVid);
imshow(depthImage, [0 4000])