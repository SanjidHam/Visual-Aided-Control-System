function Brobot()
clf
clc

%% Plot Brobot
L1 = Link('d',0.08,'a',0,'alpha',pi/2,'qlim',[deg2rad(-90) deg2rad(90)]);
L2 = Link('d',0,'a',0.14,'alpha',0,'qlim',[deg2rad(0) deg2rad(85)]);
L3 = Link('d',0,'a',0.16,'alpha',0,'qlim',[deg2rad(10) deg2rad(95)]);
L4 = Link('d',0,'a',0.05,'alpha',-pi/2,'qlim',[deg2rad(90) deg2rad(-90)]); 

base = transl(0,0,0.25); %Puts the base of the robot at this specific coordinate. 
Brobot = SerialLink([L1 L2 L3 L4],'name','Brobot','base',base); %setting the parameters of the robot                  
q = [0,pi/4,-pi/2,pi/4]; %initial positioning of the joints
scale = 0.5;
workspace = [-1 1 -1 1 -0.5 1]; %boundary of the working environment
Brobot.plot(q,'workspace',workspace,'scale',scale); %plotting the robot
hold on;

%% Background
xlabel('x');
ylabel('y');
zlabel('z');
img = imread('UTS.jpg'); 
xImage = [-1 1; -1 1];
yImage = [1 1; 1 1];
zImage = [1 1; -0.5 -0.5];
surf(xImage,yImage,zImage,'CData',img,'FaceColor','texturemap');
hold on;
