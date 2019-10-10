%%
%Setup Initialisation
rosinit('http://10.42.0.1:11311')

%%
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%%
%Setting the Position for the end effector
cartmsg_.TargetPoints=[0.142,0.185,0.054,0];
cartsvc_.call(cartmsg_)

cartmsg_.TargetPoints=[0.015,0.289,0.071,0];
cartsvc_.call(cartmsg_)

cartmsg_.TargetPoints=[0.015,0.289,-0.076,0];
cartsvc_.call(cartmsg_)

%Turn ON Suction
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=1;
grippersvc_.call(grippermsg_);

cartmsg_.TargetPoints=[0.015,0.289,0.059,0];
cartsvc_.call(cartmsg_)

cartmsg_.TargetPoints=[0.25,0.015,0.1,0];
cartsvc_.call(cartmsg_)

cartmsg_.TargetPoints=[0.243,0.027,-0.05,0];
cartsvc_.call(cartmsg_)

%Turn OFF Suction
grippermsg_.IsEndEffectorEnabled=0;
grippermsg_.EndEffectorState=0;
grippersvc_.call(grippermsg_);

cartmsg_.TargetPoints=[0.251,0.011,0.04,0];
cartsvc_.call(cartmsg_)
%%
%End Efffector Variables Setup
grippersvc_ = rossvcclient('/dobot_magician/end_effector/set_gripper');
grippermsg_ = rosmessage(grippersvc_);

%%
%Turn ON Suction
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=1;
grippersvc_.call(grippermsg_);

%%
%Turn OFF Suction
grippermsg_.IsEndEffectorEnabled=0;
grippermsg_.EndEffectorState=0;
grippersvc_.call(grippermsg_);

%%
%Gripper Open
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=0;
grippersvc_.call(grippermsg_);

%%
%Gripper Closed
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=1;
grippersvc_.call(grippermsg_);

%%
%Moving End Effector
cartmsg_.TargetPoints=[0.2,-0.1,0.15,0];
cartsvc_.call(cartmsg_)
