[f,v,data] = plyread('stop.ply','tri');
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
hold on;
for xOffset = [-1.19, -1.19]
    for zOffset =  [0,0]  
        for yOffset = [-1.0,-1.0]
            trisurf(f,v(:,3)+ xOffset,v(:,1)+ yOffset,v(:,2) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

objectVertexCount = size(v,3);%%%%get
objectVerts = v - repmat(midPoint,objectVertexCount,1);%%%%get
            
        
%% Function to move the object
forwardTR = makehgtform('translate',[0.1,0.2,0.3]);
objectPose = objectPose*forwardTR; %update the location
updatedPoints = [objectPose * [objectVerts,ones(objectVertexCount,1)]']';  %update the location
objectMesh_h.Vertices = updatedPoints(:,1:3);