function move(self, pose)
            forwardTR = makehgtform('translate',pose);
            self.objectPose = self.objectPose*forwardTR; %update the location
            updatedPoints = [self.objectPose * [self.objectVerts,ones(self.objectVertexCount,1)]']';  %update the location
            self.objectMesh_h.Vertices = updatedPoints(:,1:3);
end
objectVertexCount = size(v,3);%%%%get
midPoint = sum(v)/objectVertexCount;
objectPose = eye(4); % create the matrix 4x4 for partpose
objectVerts = v - repmat(midPoint,objectVertexCount,1);%%%%get
            
        
%% Function to move the object
forwardTR = makehgtform('translate',[0.1,0.2,0.3]);
objectPose = objectPose*forwardTR; %update the location
updatedPoints = [objectPose * [objectVerts,ones(objectVertexCount,1)]']';  %update the location
objectMesh_h.Vertices = updatedPoints(:,1:3);