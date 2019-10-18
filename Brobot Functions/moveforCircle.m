function [] = moveforCircle()
demoObject1 = placeCircle;
Brobot = plotBrobot;
T = transl(0,-0.25,0.2);
q = Brobot.ikcon(T);
%% Movement for Circle
steps = 20;

%HOME
TH = transl(0,-0.25,0.2);
qH = Brobot.ikcon(TH);
qMatrix = jtraj(q,qH,steps);
Brobot.animate(qMatrix);

disp ('Large Circle Detected.');
%Move for object
T1 = transl(0.03,0.23,0.2);
q1 = Brobot.ikcon(T1);
qMatrix = jtraj(qH,q1,steps);
Brobot.animate(qMatrix);

T2 = transl(0.03,0.23,0.085);
q2 = Brobot.ikcon(T2);
qMatrix = jtraj(q1,q2,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject1.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end
% %Line Check
% intersectionLim()
% result = IsIntersectionPointInsideTriangle(intersectP,triangleVerts)
% s = 2;
% while ~isempty(find(1 < abs(diff(rad2deg(jtraj(q1,q2,s)))),1))
%     s = s + 1;
% end
% qMatrix = jtraj(q1,q2,s);
% 
% % 2.7
% result = true(s,1);
% for i = 1: s
%     result(i) = IsCollision(Brobot,qMatrix(i,:),faces,vertex,faceNormals,false);
%     Brobot.animate(qMatrix(i,:));
% end

T3 = transl(0.03,0.23,0.2);
q3 = Brobot.ikcon(T3);
qMatrix = jtraj(q2,q3,steps);
%Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject1.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T4 = transl(0.1806,-0.181,0.2);
q4 = Brobot.ikcon(T4);
qMatrix = jtraj(q3,q4,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject1.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T5 = transl(0.1806,-0.181,0.085);
q5 = Brobot.ikcon(T5);
qMatrix = jtraj(q4,q5,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject1.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T6 = transl(0.1806,-0.181,0.2);
q6 = Brobot.ikcon(T6);
qMatrix = jtraj(q5,q6,steps);
Brobot.animate(qMatrix);

%return home
T7 = transl(0,-0.25,0.2);
q7 = Brobot.ikcon(T7);
qMatrix = jtraj(q6,q7,steps);
Brobot.animate(qMatrix);

end