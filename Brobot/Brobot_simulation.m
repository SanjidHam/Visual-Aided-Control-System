function Brobot_simulation()
clf
clc

%% Plot Brobot

scale = 0.5;
workspace = [-1.2 1.2 -1.2 1.2 -0.6 1]; %boundary of the working environment

L1 = Link('d',0.08,'a',0,'alpha',-pi/2,'qlim',[deg2rad(-135) deg2rad(135)]);
L2 = Link('d',0,'a',0.14,'alpha',0,'qlim',[deg2rad(5) deg2rad(80)],'offset', -pi/2);
L3 = Link('d',0,'a',0.16,'alpha',0,'qlim',[deg2rad(15) deg2rad(170)]);
L4 = Link('d',0,'a',0.05,'alpha',pi/2,'qlim',[deg2rad(-90) deg2rad(90)]);
L5 = Link('d',-0.05,'a',0,'alpha',0,'qlim',[deg2rad(-85) deg2rad(85)]);

base = transl(0,0,0); %Puts the base of the robot at this specific coordinate. 
Brobot = SerialLink([L1 L2 L3 L4 L5],'name','Brobot','base',base); %setting the parameters of the robot                  

% q = [0,3*pi/4,pi/4,0,0]; %initial positioning of the joints

T = transl(0.25,0,0.15);
q = Brobot.ikcon(T);

Brobot.plot(q,'workspace',workspace,'scale',scale); %plotting the robot
hold on

%% SAFETY FEATURES
%Laser
for x = -1.025:0.05:1.025
    line ('XData', [x x], 'YData', [0.5025 0.5025], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for x = -1.025:0.05:1.025
    line ('XData', [x x], 'YData', [-0.5025 -0.5025], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for y = -0.5025:0.05:0.5025
    line ('XData', [1.025 1.025], 'YData', [y y], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end
for y = -0.5025:0.05:0.5025
    line ('XData', [-1.025 -1.025], 'YData', [y y], 'ZData', [0.6 -0.6], 'Color', [1 0 0]);
end

%Stop Button
[f,v,topH] = plyread('stop.ply','tri');
vertexColours = [topH.vertex.red, topH.vertex.green, topH.vertex.blue]/255;
hold on;
for xOffset = [-1.19, -1.19]
    for zOffset =  [0,0]  
        for yOffset = [-1.0,-1.0]
            trisurf(f,v(:,3)+ xOffset,v(:,1)+ yOffset,v(:,2) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

[f,v,data] = plyread('stopbuttonbase.ply','tri');
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
for xOffset = [-1.19, -1.19]
    for zOffset = [0,0]   
        for yOffset = [-1.0,-1.0]
        trisurf(f,v(:,3)+ xOffset,v(:,1) + yOffset, v(:,2) + zOffset ...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

%Fire Extinguisher
[f,v,topH] = plyread('fireEX.ply','tri');
vertexColours = [topH.vertex.red, topH.vertex.green, topH.vertex.blue]/255;
hold on;
for xOffset = [-1, -1]
    for zOffset =  [-0.6,-0.6]  
        for yOffset = [-1.0,-1.0]
            trisurf(f,v(:,1)+ xOffset,v(:,2)+ yOffset,v(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

hold on;

%Caution Poster
img = imread('caution.jpg'); 
xImage = [-1.19 -1.19; -1.19 -1.19];
yImage = [-1.125 -0.875; -1.125 -0.875];
zImage = [0.5 0.5; 0.25 0.25];
surf(xImage,yImage,zImage,'CData',img,'FaceColor','texturemap');

%% BACKGROUND
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

%Table 
[f,v,bottomH] = plyread('Table.ply','tri');

%Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [bottomH.vertex.red, bottomH.vertex.green, bottomH.vertex.blue] / 255;

for zOffset = [-.15, -.15]
    for yOffset = [0, 0]
    platform_h = trisurf(f,v(:,1),v(:,2)+yOffset, v(:,3) + zOffset ...
        ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
    end
end
hold on;

%% Movement
s = 20;
T1 = transl(-0.25,0.18,0.15);
q1 = Brobot.ikcon(T1);
qMatrix = jtraj(q,q1,s);
Brobot.animate(qMatrix);

T2 = transl(-0.25,0.18,0.05);
q2 = Brobot.ikcon(T2);
qMatrix = jtraj(q1,q2,s);
Brobot.animate(qMatrix);

T3 = transl(-0.25,0.18,0.15);
q3 = Brobot.ikcon(T3);
qMatrix = jtraj(q2,q3,s);
Brobot.animate(qMatrix);

T4 = transl(0.22,0.15,0.15);
q4 = Brobot.ikcon(T4);
qMatrix = jtraj(q3,q4,s);
Brobot.animate(qMatrix);

T5 = transl(0.22,0.15,0.05);
q5 = Brobot.ikcon(T5);
qMatrix = jtraj(q4,q5,s);
Brobot.animate(qMatrix);

T6 = transl(0.22,0.15,0.15);
q6 = Brobot.ikcon(T6);
qMatrix = jtraj(q5,q6,s);
Brobot.animate(qMatrix);