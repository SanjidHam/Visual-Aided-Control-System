function Brobot_simulation()
clf
clc

%% Plot Brobot          
Brobot = plotBrobot;

%% SAFETY FEATURES
camlight;
%Laser
laser;

%Stop Button
stopButton;       

%Fire Extinguisher
fireExtinguisher;

hold on;

%Caution Poster
cautionPoster;

%Enclosure
enclosure;
%% BACKGROUND
% Walls & Floor
room;

%Table 
tableSurface;

%% Demo Accessories
%Primary Tray
primaryTray;
%Secondary Tray
secondaryTray;
%Small Circle
demoObject1 = placeCircle;
demoObject2 = placeSquare;


%% Camera Detection Starts
disp ('Camera Detecting Missing Shape');
pause (2);
promptCamera;
end