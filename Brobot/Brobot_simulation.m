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

%% BACKGROUND
% Walls & Floor
room;

%Table 
tableSurface;

%% Demo Accessories
%Small Circle
% demoObject = placeCircle;

%% If camera detects Circle
moveforCircle;

end