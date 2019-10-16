function moveObject(Obj,pose)
forwardTR = makehgtform('translate',pose);
Obj.objectPose = Obj.objectPose*forwardTR; %update the location
updatedPoints = [Obj.objectPose * [vNew,ones(Obj.objectVertexCount,1)]']';  %update the location
Obj.objectMesh.Vertices = updatedPoints(:,1:3);
end

