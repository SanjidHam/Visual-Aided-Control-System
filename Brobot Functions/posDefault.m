function posDefault()
%POSDEFAULT 
% Positioning the end effector to a default position

%Set the Cartesian Position of the end effector (SET UP VARIABLES)
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

%End Efffector Variables Setup
suctioncupsvc_ = rossvcclient('/dobot_magician/end_effector/set_suction_cup');
suctioncupmsg_ = rosmessage(suctioncupsvc_);

% home
cartmsg_.TargetPoints=[0.2,0.09,0.03,0];
cartsvc_.call(cartmsg_)

%pick up Pos 1
cartmsg_.TargetPoints=[0.18,0.16,0.03,0];
cartsvc_.call(cartmsg_)

%pick up Pos 2 (default)
cartmsg_.TargetPoints=[0.03,0.19,0.03,0];
cartsvc_.call(cartmsg_)



end

