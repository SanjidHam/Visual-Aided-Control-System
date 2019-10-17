classdef placeCircle

properties (SetAccess = private)
objectVertexCount;
objectPose;
objectMesh;
vNew;
end
    
methods
%% Places Object on workspace
function [demoObject] = placeCircle()
[f,v,data] = plyread('circleSmall','tri');
demoObject.objectVertexCount = size(v,1);
midPoint = sum(v)/demoObject.objectVertexCount;
demoObject.objectPose = eye(4); % creates the matrix 4x4 for partpose
demoObject.vNew = v - repmat(midPoint,demoObject.objectVertexCount,1);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
for zOffset = [-0.05073,-0.05073]
    for xOffset = [0,0]   
        for yOffset = [0.25,0.25]
            demoObject.objectMesh = trisurf(f,demoObject.vNew(:,1)+ xOffset,demoObject.vNew(:,2)+ yOffset,demoObject.vNew(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

end

%% Moves Object
function moveObject(demoObject,pose)
forwardTR = makehgtform('translate',pose);
demoObject.objectPose = demoObject.objectPose*forwardTR; %update the location
updatedPoints = [demoObject.objectPose * [demoObject.vNew,ones(demoObject.objectVertexCount,1)]']';  %update the location
demoObject.objectMesh.Vertices = updatedPoints(:,1:3);
end

end

end