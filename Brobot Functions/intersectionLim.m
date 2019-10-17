%% 1 intersect 
function intersectionLim()
plotOptions.plotFaces = true;
[vertex,faces,faceNormals] = RectangularPrism([0,0,-0.5], [1,0.3,0.6],plotOptions);
hold on

% 2.4: Get the transform of every joint (i.e. start and end of every link)
tr = zeros(4,4,robot.n+1);
tr(:,:,1) = robot.base;
L = robot.links;
for i = 1 : robot.n
    tr(:,:,i+1) = tr(:,:,i) * trotz(q(i)+L(i).offset) * transl(0,0,L(i).d) * transl(L(i).a,0,0) * trotx(L(i).alpha);
end

% 2.5: Go through each link and also each triangle face
for i = 1 : size(tr,3)-1    
    for faceIndex = 1:size(faces,1)
        vertOnPlane = vertex(faces(faceIndex,1)',:);
        [intersectP,check] = LinePlaneIntersection(faceNormals(faceIndex,:),vertOnPlane,tr(1:3,4,i)',tr(1:3,4,i+1)'); 
        if check == 1 && IsIntersectionPointInsideTriangle(intersectP,vertex(faces(faceIndex,:)',:))
            plot3(intersectP(1),intersectP(2),intersectP(3),'r*');
            display('Collision Detected');
        end
    end    
end
end