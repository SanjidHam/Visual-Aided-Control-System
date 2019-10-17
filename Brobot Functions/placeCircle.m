classdef placeCircle

properties (SetAccess = private)
objectVertexCount;
objectPose;
objectMesh;
vNew;
end
    
methods
%% Places Object on workspace
function self = placeCircle()
[f,v,data] = plyread('circleSmall.ply','tri');
self.objectVertexCount = size(v,1);
midPoint = sum(v)/self.objectVertexCount;
self.objectPose = eye(4); % creates the matrix 4x4 for partpose
self.vNew = v - repmat(midPoint,self.objectVertexCount,1);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
for zOffset = [0.08,0.08]
    for xOffset = [0,0]   
        for yOffset = [0.25,0.25]
            self.objectMesh = trisurf(f,self.vNew(:,1)+ xOffset,self.vNew(:,2)+ yOffset,self.vNew(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

end

%% Moves Object
function moveObject(self,pose)
forwardTR = makehgtform('translate',pose);
self.objectPose = self.objectPose*forwardTR; %update the location
updatedPoints = [self.objectPose * [self.vNew,ones(self.objectVertexCount,1)]']';  %update the location
self.objectMesh.Vertices = updatedPoints(:,1:3);
end

end

end