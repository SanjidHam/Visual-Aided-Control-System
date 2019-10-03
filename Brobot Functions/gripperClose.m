function [] = gripperClose()
%GRIPPERCLOSE Summary of this function goes here
grippersvc_ = rossvcclient('/dobot_magician/end_effector/set_gripper');
grippermsg_ = rosmessage(grippersvc_);

grippermsg_.IsEndEffectorEnabled=1;
grippermsg_.EndEffectorState=1;
grippersvc_.call(grippermsg_);
end

