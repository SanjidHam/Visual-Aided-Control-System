function [] = moveforSquare()
demoObject2 = placeSquare;
Brobot = plotBrobot;
T = transl(0.2,0.15,0.2);
q = Brobot.ikcon(T);
%% Movement for Square
steps = 20;

%HOME
TH = transl(0.2,0.15,0.2);
qH = Brobot.ikcon(TH);
qMatrix = jtraj(q,qH,steps);
Brobot.animate(qMatrix);

disp ('Large Square Detected.');
%Move for object
T1 = transl(0.1258,0.2773,0.2);
q1 = Brobot.ikcon(T1);
qMatrix = jtraj(qH,q1,steps);
Brobot.animate(qMatrix);

T2 = transl(0.1258,0.2773,0.085);
q2 = Brobot.ikcon(T2);
qMatrix = jtraj(q1,q2,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject2.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T3 = transl(0.1258,0.2773,0.2);
q3 = Brobot.ikcon(T3);
qMatrix = jtraj(q2,q3,steps);
%Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject2.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T4 = transl(0.2754,-0.2307,0.2);
q4 = Brobot.ikcon(T4);
qMatrix = jtraj(q3,q4,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject2.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T5 = transl(0.2754,-0.2307,0.085);
q5 = Brobot.ikcon(T5);
qMatrix = jtraj(q4,q5,steps);
% Brobot.animate(qMatrix);
%object moves
for trajsteps = 1:size(qMatrix,1)
    qSim = qMatrix(trajsteps,:);
    Brobot.animate(qSim);
    trnsf = Brobot.fkine(qSim);
    demoObject2.moveObject(trnsf(1:3,4));
    drawnow;
    pause(0);
end

T6 = transl(0.2754,-0.2307,0.2);
q6 = Brobot.ikcon(T6);
qMatrix = jtraj(q5,q6,steps);
Brobot.animate(qMatrix);

%return home
T7 = transl(0.2,0.15,0.2);
q7 = Brobot.ikcon(T7);
qMatrix = jtraj(q6,q7,steps);
Brobot.animate(qMatrix);

end