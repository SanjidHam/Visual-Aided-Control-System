%% 2
function intersectionCheck (qA,qB)
s = 2;
while ~isempty(find(1 < abs(diff(rad2deg(jtraj(qA,qB,s)))),1))
    s = s + 1;
end
qMatrix = jtraj(qA,qB,s);

% 2.7
result = true(s,1);
for i = 1: s
    result(i) = IsCollision(Brobot,qMatrix(i,:),faces,vertex,faceNormals,false);
    Brobot.animate(qMatrix(i,:));
end
end