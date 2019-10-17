function [] = moveObject(demoObject,pose)
forwardTR = makehgtform('translate',pose);
demoObject.objectPose = demoObject.objectPose * forwardTR; %update the location
updatedPoints = [demoObject.objectPose * [demoObject.vNew,ones(demoObject.objectVertexCount,1)]']';  %update the location
demoObject.objectMesh.Vertices = updatedPoints(:,1:3);
end

