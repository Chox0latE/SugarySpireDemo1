function state_player_uppercut()
{
	static attack_afterimagetimer = 6;
	image_speed = 0.35;
	if (sprite_index == spr_player_uppercutbegin && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_player_uppercutend;
		image_index = 0;
	}
	if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + xscale, y) && move != 0)
		movespeed = 0;
	move = key_left + key_right;
	landAnim = 1;
	jumpstop = 0;
	hsp = movespeed;
	if (move != 0)
	{
		dir = move;
		movespeed = approach(movespeed, move * 5, 0.5);
	}
	if (grounded && vsp > 0)
	{
		scr_sound(sound_step);
		landAnim = 1;
		movespeed = abs(movespeed);
		input_buffer_secondjump = 0;
		state = 1;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
		instance_create_depth(x, y, 0, obj_landcloud);
	}
	if (attack_afterimagetimer > 0)
		attack_afterimagetimer--;
	if (attack_afterimagetimer <= 0 && vsp <= 0)
	{
		with (instance_create(x, y, obj_attack_aftereffect))
			playerID = other.id;
		attack_afterimagetimer = 6;
	}
}
