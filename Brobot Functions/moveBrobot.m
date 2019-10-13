function [Brobot] = moveBrobot()


Brobot = plotBrobot;
T = transl(0.25,0,0.15);
q = Brobot.ikcon(T);

s = 20;
T1 = transl(-0.25,0.18,0.15);
q1 = Brobot.ikcon(T1);
qMatrix = jtraj(q,q1,s);
Brobot.animate(qMatrix);

T2 = transl(-0.25,0.18,0.05);
q2 = Brobot.ikcon(T2);
qMatrix = jtraj(q1,q2,s);
Brobot.animate(qMatrix);

T3 = transl(-0.25,0.18,0.15);
q3 = Brobot.ikcon(T3);
qMatrix = jtraj(q2,q3,s);
Brobot.animate(qMatrix);

T4 = transl(0.22,0.15,0.15);
q4 = Brobot.ikcon(T4);
qMatrix = jtraj(q3,q4,s);
Brobot.animate(qMatrix);

T5 = transl(0.22,0.15,0.05);
q5 = Brobot.ikcon(T5);
qMatrix = jtraj(q4,q5,s);
Brobot.animate(qMatrix);

T6 = transl(0.22,0.15,0.15);
q6 = Brobot.ikcon(T6);
qMatrix = jtraj(q5,q6,s);
Brobot.animate(qMatrix);

end