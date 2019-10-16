function Obj = placeObject(object)
Obj.filename = object;
[f,v,data] = plyread(Obj.filename,'tri');
Obj.objectVertexCount = size(v,1);%%%%get
midPoint = sum(v)/Obj.objectVertexCount;
Obj.objectPose = eye(4); % create the matrix 4x4 for partpose
Obj.vNew = v - repmat(midPoint,Obj.objectVertexCount,1);%%%%get
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
hold on;
for zOffset = [0.01,0.01]
    for xOffset = [0,0]   
        for yOffset = [0.18,0.18]
            Obj.objectMesh = trisurf(f,Obj.vNew(:,1)+ xOffset,Obj.vNew(:,2)+ yOffset,Obj.vNew(:,3) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end
end