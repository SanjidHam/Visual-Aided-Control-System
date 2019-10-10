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