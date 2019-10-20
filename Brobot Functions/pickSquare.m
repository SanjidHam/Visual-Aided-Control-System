function pickSquare()
%PICKSQUARE Summary of this function goes here
%   Detailed explanation goes here

%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%End Efffector Variables Setup
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);


%pick up Pos 2 (default)
cartmsg_.TargetPoints=[0.03,0.19,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn

%poisition for square pick up 1
cartmsg_.TargetPoints=[0.035,0.26,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn
%poisition for square pick up 2
cartmsg_.TargetPoints=[0.037,0.254,-0.067,0];
cartsvc_.call(cartmsg_)

suctionOn

%poisition for square pick up 3
cartmsg_.TargetPoints=[0.036,0.251,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn
%pick up Pos 2 (default)
cartmsg_.TargetPoints=[0.03,0.19,0.03,0];
cartsvc_.call(cartmsg_)
suctionOn

end

