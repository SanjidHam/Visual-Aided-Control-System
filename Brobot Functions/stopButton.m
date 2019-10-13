function [] = stopButton()

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
hold on;
for xOffset = [-1.19, -1.19]
    for zOffset = [0,0]   
        for yOffset = [-1.0,-1.0]
        trisurf(f,v(:,3)+ xOffset,v(:,1) + yOffset, v(:,2) + zOffset ...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
        end
    end
end

hold on;

end