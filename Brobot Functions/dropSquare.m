function dropSquare
%DROPSQUARE Summary of this function goes here
%   Detailed explanation goes here
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%End Efffector Variables Setup
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);
suctionOn

% position for square drop 1
cartmsg_.TargetPoints=[0.306,-0.04,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn

% position for square drop 2
cartmsg_.TargetPoints=[0.306,-0.04,-0.0625,0];
cartsvc_.call(cartmsg_)
suctionOn

% position for square drop 3
cartmsg_.TargetPoints=[0.306,-0.04,0.03,0];
cartsvc_.call(cartmsg_)
suctionOff

posDefault


end

