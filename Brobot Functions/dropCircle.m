function dropCircle()
%DROPCIRCLE Summary of this function goes here
%   Detailed explanation goes here
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%End Efffector Variables Setup
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);
suctionOn
% position for circle drop 1
cartmsg_.TargetPoints=[0.255,-0.04,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn
cartmsg_.TargetPoints=[0.252,-0.037,-0.05,0];
cartsvc_.call(cartmsg_)
suctionOn
cartmsg_.TargetPoints=[0.255,-0.04,0.03,0];
cartsvc_.call(cartmsg_)
suctionOff
posDefault


suctionOff
end

