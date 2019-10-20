function suctionOn()
%SUCTIONON Summary of this function goes here
%   Detailed explanation goes here
%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%End Efffector Variables Setup
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);

%Turn ON Suction
suctioncupmsg_.IsEndEffectorEnabled=1;
suctioncupmsg_.EndEffectorState=1;
suctioncupsvc_.call(suctioncupmsg_);
end

