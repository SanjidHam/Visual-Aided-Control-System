function [] = fireExtinguisher()

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

end