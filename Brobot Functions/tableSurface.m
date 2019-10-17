function [] = tableSurface()
[f,v,bottomH] = plyread('table.ply','tri');

%Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [bottomH.vertex.red, bottomH.vertex.green, bottomH.vertex.blue] / 255;

for zOffset = [-.13, -.13]
    for yOffset = [0, 0]
    platform_h = trisurf(f,v(:,1),v(:,2)+yOffset, v(:,3) + zOffset ...
        ,'FaceVertexCData',vertexColours,'EdgeColor','interp','EdgeLighting','flat');
    end
end
hold on;

end