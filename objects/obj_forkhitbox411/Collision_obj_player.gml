if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzano_shoulderbash || obj_player.state == states.pizzano_rocketfist || obj_player.state == states.minecart))
	exit;
event_inherited();
