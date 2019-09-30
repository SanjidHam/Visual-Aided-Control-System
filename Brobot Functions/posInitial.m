function [] = posInitial()
%POSINITIAL Summary of this function goes here
cartsvc_ = rossvcclient('/dobot_magician/PTP/set_cartesian_pos');
cartmsg_ = rosmessage(cartsvc_);

cartmsg_.TargetPoints=[0.2,-0.1,0.15,0];
cartsvc_.call(cartmsg_)

end

