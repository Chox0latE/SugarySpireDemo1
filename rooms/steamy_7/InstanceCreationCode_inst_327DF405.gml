flags.do_once_per_save = true;
condition = function()
{
	var _check = false;
	with (obj_player)
	{
		if (place_meeting(roomstartx, roomstarty, other))
			_check = true;
	}
	return _check;
};
output = function()
{
	for (var i = 0; i < (sprite_get_number(spr_clocktowerexteriorDebris) - 1); i++)
	{
		with (instance_create(x + irandom_range(-3, 3) + (sprite_width / 2), y + irandom_range(-3, 3) + (sprite_height / 2), obj_debris))
		{
			hsp += irandom_range(-5, -9);
			sprite_index = spr_clocktowerexteriorDebris;
			image_index = i;
		}
	}
	repeat (3)
	{
		with (instance_create(x + irandom_range(-3, 3) + (sprite_width / 2), y + irandom_range(-3, 3) + (sprite_height / 2), obj_debris))
		{
			hsp += irandom_range(-5, -9);
			sprite_index = spr_clocktowerexteriorDebris;
			image_index = irandom_range(0, sprite_get_number(spr_clocktowerexteriorDebris) - 1);
		}
	}
	camera_shake(20, 40);
	scr_sound(sound_metaldestroy);
};
