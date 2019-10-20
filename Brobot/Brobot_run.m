%%
%Setup Initialisation
rosinit('http://10.42.0.1:11311')

%%
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%% camera 
clear all

% taking a picture with camera and identifying the shape
cam = webcam(2);
f = snapshot(cam);
imshow(f)
rgb = imcrop(f, [138 144 160 600]);
% figure
 imshow (rgb)

% identifying the square shape
getSquare(rgb)

% identifying the circle shape
% circleDetection1;
if getSquare(rgb) == 1
    pickSquare % picking up the square shape from secondary tray
    dropSquare % placing the sqaure shape on the primary shape
    
else 
    pickCircle % picking up the circle shape from secondary tray
    dropCircle % placing the circle shape on the primary shape
end

% due to facing probelms faced during the demo to detect the circle with the camera, we had hard coded this bit to pick and place the circle
	pickCircle
   	dropCircle 
%posDefault;
