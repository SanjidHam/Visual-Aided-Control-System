%% obstacle
function obstacle()
clf

J1 = Link('d',0.1519,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(0), deg2rad(360)]);

J2 = Link('d',0,'a',0.24365,'alpha',0,'offset',0,'qlim',[deg2rad(-200), deg2rad(200)]);

J3 = Link('d',0,'a',0.21325,'alpha',0,'offset',0,'qlim',[deg2rad(-170), deg2rad(170)]);

J4 = Link('d',0.11235,'a',0,'alpha',pi/2,'offset',0,'qlim',[deg2rad(0), deg2rad(360)]);

J5 = Link('d',0.08535,'a',0,'alpha',-pi/2,'offset',0,'qlim',[deg2rad(0), deg2rad(360)]);

J6 = Link('d',0.0819,'a',0,'alpha',0,'offset',0,'qlim',[deg2rad(0), deg2rad(360)]);
 
robot.base = transl (0.22,0.22,0);

robot = SerialLink([J1 J2 J3 J4 J5 J6], 'name', 'UR3.2', 'base' , robot.base);
workspace = [-1.1 1.1 -0.1 1.1 -0.5 1];
q = zeros(1,6);
pos2 = robot.fkine(q);
scale = 0.5;
robot.plot(q, 'workspace', workspace, 'scale', scale)
x2 = pos2(1,4); 
y2 = pos2(2,4);
z2 = pos2(3,4);

%hold on;
    centerpnt = [0.3,0,0];
    side = 0.2;
    plotOptions.plotFaces = true;


%%
%steps = 30;
t1 = transl (x2, y2, z2);
q1 = robot.ikine(t1, q,[1,1,1,0,0,0]);
t2 = transl (0.42, 0.47, 0.5);
q2 = robot.ikine(t2 ,q,[1,1,1,0,0,0]); 

vel=0.02;
steps = 2;
while ~isempty(find(1 < abs(diff(rad2deg(jtraj(q1,q2,steps)))),1))
    steps = steps + 1;
end
qMatrix = jtraj(q1,q2,steps);

% 2.7
result = true(steps,1);
for i = 1: steps
    vel=vel+0.002;
    
    
    
    [vertex,faces,faceNormals] = RectangularPrism(vel+centerpnt-side/2, vel+centerpnt+side/2,plotOptions);
    
    
    try delete(p); end
    tcolor = [.2 .2 .8];
    
    p = patch('Faces',faces,'Vertices',vertex,'FaceVertexCData',tcolor,'FaceColor','flat','lineStyle','none');
    
    result(i) = IsCollision(robot,qMatrix(i,:),faces,vertex,faceNormals,false);
    robot.animate(qMatrix(i,:));
end
%%
function result = IsIntersectionPointInsideTriangle(intersectP,triangleVerts)

u = triangleVerts(2,:) - triangleVerts(1,:);
v = triangleVerts(3,:) - triangleVerts(1,:);

uu = dot(u,u);
uv = dot(u,v);
vv = dot(v,v);

w = intersectP - triangleVerts(1,:);
wu = dot(w,u);
wv = dot(w,v);

D = uv * uv - uu * vv;

% Get and test parametric coords (s and t)
s = (uv * wv - vv * wu) / D;
if (s < 0.0 || s > 1.0)        % intersectP is outside Triangle
    result = 0;
    return;
end

t = (uv * wu - uu * wv) / D;
if (t < 0.0 || (s + t) > 1.0)  % intersectP is outside Triangle
    result = 0;
    return;
end

result = 1;                      % intersectP is in Triangle
end
%% IsCollision
% This is based upon the output of questions 2.5 and 2.6
% Given a robot model (robot), and trajectory (i.e. joint state vector) (qMatrix)
% and triangle obstacles in the environment (faces,vertex,faceNormals)
function result = IsCollision(robot,qMatrix,faces,vertex,faceNormals,returnOnceFound)
if nargin < 6
    returnOnceFound = true;
end
result = false;

for qIndex = 1:size(qMatrix,1)
    % Get the transform of every joint (i.e. start and end of every link)
    tr = GetLinkPoses(qMatrix(qIndex,:), robot);

    % Go through each link and also each triangle face
    for i = 1 : size(tr,3)-1    
        for faceIndex = 1:size(faces,1)
            vertOnPlane = vertex(faces(faceIndex,1)',:);
            [intersectP,check] = LinePlaneIntersection(faceNormals(faceIndex,:),vertOnPlane,tr(1:3,4,i)',tr(1:3,4,i+1)'); 
            if check == 1 && IsIntersectionPointInsideTriangle(intersectP,vertex(faces(faceIndex,:)',:))
                plot3(intersectP(1),intersectP(2),intersectP(3),'r*');
                display('Intersection');
                %uiwait;
                result = true;
                if returnOnceFound
                    return
                end
            end
        end    
    end
end
end
%% GetLinkPoses
% q - robot joint angles
% robot -  seriallink robot model
% transforms - list of transforms
function [ transforms ] = GetLinkPoses( q, robot)

links = robot.links;
transforms = zeros(4, 4, length(links) + 1);
transforms(:,:,1) = robot.base;

for i = 1:length(links)
    L = links(1,i);
    
    current_transform = transforms(:,:, i);
    
    current_transform = current_transform * trotz(q(1,i) + L.offset) * ...
    transl(0,0, L.d) * transl(L.a,0,0) * trotx(L.alpha);
    transforms(:,:,i + 1) = current_transform;
end
end

%% FineInterpolation
% Use results from Q2.6 to keep calling jtraj until all step sizes are
% smaller than a given max steps size
function qMatrix = FineInterpolation(q1,q2,maxStepRadians)
if nargin < 3
    maxStepRadians = deg2rad(1);
end
    
steps = 2;
while ~isempty(find(maxStepRadians < abs(diff(jtraj(q1,q2,steps))),1))
    steps = steps + 1;
end
qMatrix = jtraj(q1,q2,steps);
end

end
