function [] = stopButton()

[f,v,data] = plyread('stop.ply','tri'); %inputs file
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue]/255;
hold on;
for xOffset = [-1.19, -1.19] %x pos
    for zOffset =  [0,0] %z pos 
        for yOffset = [-1.0,-1.0] %y pos
            trisurf(f,v(:,3)+ xOffset,v(:,1)+ yOffset,v(:,2) + zOffset...
            ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat'); %places object on to workspace
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