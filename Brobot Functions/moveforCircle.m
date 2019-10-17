function [] = moveforCircle()
demoObject = smallCircle;
Brobot = plotBrobot;
%% Movement for Circle
T = transl(0.25,0,0.2);
q = Brobot.ikcon(T);

steps = 20;
T1 = transl(0,0.25,0.2);
q1 = Brobot.ikcon(T1);
qMatrix = jtraj(q,q1,steps);
Brobot.animate(qMatrix);

T2 = transl(0,0.25,0.1);
q2 = Brobot.ikcon(T2);
qMatrix = jtraj(q1,q2,steps);
Brobot.animate(qMatrix);

T3 = transl(0,0.25,0.2);
q3 = Brobot.ikcon(T3);
qMatrix = jtraj(q2,q3,steps);
Brobot.animate(qMatrix);
%object moves
moveObject(smallCircle,[0;0.25;0.19]);


T4 = transl(0.22,0.15,0.15);
q4 = Brobot.ikcon(T4);
qMatrix = jtraj(q3,q4,steps);
Brobot.animate(qMatrix);
%object moves
% delete(ABC);
moveObject(smallCircle,[0.22;0.15;0.14]);

T5 = transl(0.22,0.15,0.1);
q5 = Brobot.ikcon(T5);
qMatrix = jtraj(q4,q5,steps);
Brobot.animate(qMatrix);
%object moves
% delete(ABC);
moveObject(smallCircle,[0.22;0.15;0.09]);

T6 = transl(0.22,0.15,0.15);
q6 = Brobot.ikcon(T6);
qMatrix = jtraj(q5,q6,steps);
Brobot.animate(qMatrix);

end