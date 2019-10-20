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
[f,v,data] = plyread('circleLarge.ply','tri');
self.objectVertexCount = size(v,1);
midPoint = sum(v)/self.objectVertexCount; % generates midpoint value for accurate motion
self.objectPose = eye(4); % creates the matrix 4x4 for partpose
self.vNew = v - repmat(midPoint,self.objectVertexCount,1);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
for zOffset = [0.07627,0.07627]
    for xOffset = [0.03104,0.03104]   
        for yOffset = [0.2276,0.2276]
            self.objectMesh = trisurf(f,self.vNew(:,1)+ xOffset,self.vNew(:,2)+ yOffset,self.vNew(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

end

%% Moves Object
function moveObject(self,pose)
forwardTR = makehgtform('translate',pose); 
self.objectPose = self.objectPose*forwardTR; %updates location
updatedPoints = [self.objectPose * [self.vNew,ones(self.objectVertexCount,1)]']'; %updates location
self.objectMesh.Vertices = updatedPoints(:,1:3);
end

end

end