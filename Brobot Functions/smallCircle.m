function [demoObject] = smallCircle ()

[f,v,data] = plyread('circleSmall.ply','tri');
demoObject.objectVertexCount = size(v,1);
midPoint = sum(v)/demoObject.objectVertexCount;
demoObject.objectPose = eye(4); % creates the matrix 4x4 for partpose
demoObject.vNew = v - repmat(midPoint,demoObject.objectVertexCount,1);
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
for zOffset = [0.09,0.09]%[-0.05073,-0.05073]
    for xOffset = [0,0]   
        for yOffset = [0.25,0.25]
            demoObject.objectMesh = trisurf(f,demoObject.vNew(:,1)+ xOffset,demoObject.vNew(:,2)+ yOffset,demoObject.vNew(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

end
