%%
%Setup Initialisation
rosinit('http://10.42.0.1:11311')

%%
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%%
%Setting the Position for the end effector
cartmsg_.TargetPoints=[0.25,0.02,0.05,0.19];
cartsvc_.call(cartmsg_)

%%
%Gripper Variables Setup
grippersvc_ = rossvcclient('/dobot_magician/end_effector/set_gripper');
grippermsg_ = rosmessage(grippersvc_);

%%
%Turn ON Gripper
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=1;
grippersvc_.call(grippermsg_);

%%
%Turn OFF Gripper
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

%%
%%
cartmsg_.TargetPoints=[0.1,0.2,0.0,0];
cartsvc_.call(cartmsg_)

%%
cartmsg_.TargetPoints=[0.11,0.1,0.15,0];
cartsvc_.call(cartmsg_)

%%
cartmsg_.TargetPoints=[0.2,-0.1,0.0,0];
cartsvc_.call(cartmsg_)

%%
cartmsg_.TargetPoints=[0.2,-0.1,0.15,0];
cartsvc_.call(cartmsg_)

%%
cartmsg_.TargetPoints=[0.2,-0.1,0.15,0];
cartsvc_.call(cartmsg_)

%%
cartmsg_.TargetPoints=[0.2,-0.1,0.15,0];
cartsvc_.call(cartmsg_)



%%

cartmsg_.TargetPoints=[0.25,0.02,0.13,0.5];
cartsvc_.call(cartmsg_)

%Gripper Open
grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=0;
grippersvc_.call(grippermsg_);

cartmsg_.TargetPoints=[0.25,0.02,0.05,0.5];
cartsvc_.call(cartmsg_)





