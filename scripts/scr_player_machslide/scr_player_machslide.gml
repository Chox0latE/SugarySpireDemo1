function state_player_machslide()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	if (sprite_index != spr_player_hurtroll)
		movespeed = approach(movespeed, 0, 0.4);
	if (sprite_index == spr_player_hurtroll && grounded)
		sprite_index = spr_player_crouchslide;
	if (sprite_index == spr_player_crouchslide && movespeed <= 0)
		state = 1;
	if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_machslide;
	if (animation_end() && !grounded)
	{
		switch (sprite_index)
		{
			case spr_machslideboost:
				sprite_index = spr_machslideboostFallStart;
				image_index = 0;
				break;
			case spr_machslideboostFallStart:
				sprite_index = spr_machslideboostFall;
				image_index = 0;
				break;
			case spr_machslideboost3:
				sprite_index = spr_machslideboost3FallStart;
				image_index = 0;
				break;
			case spr_machslideboost3FallStart:
				sprite_index = spr_machslideboost3Fall;
				image_index = 0;
				break;
		}
	}
	image_speed = 0.35;
	landAnim = 0;
	if (sprite_index == spr_machslide || sprite_index == spr_player_crouchslide)
	{
		if (floor(movespeed) <= 0)
		{
			image_index = 0;
			if (sprite_index == spr_machslide)
				machslideAnim = 1;
			movespeed = 0;
			state = 1;
		}
		if (scr_solid(x + xscale, y, true))
		{
			state = 72;
			movespeed = 0;
			image_index = 0;
			sprite_index = spr_splat;
		}
	}
	if (grounded && ((animation_end() && sprite_index == spr_machslideboost) || (sprite_index == spr_machslideboostFallStart || sprite_index == spr_machslideboostFall)))
	{
		hsp = 0;
		image_index = 0;
		xscale *= -1;
		movespeed = 8;
		state = 69;
		instance_create(x, y, obj_jumpdust);
	}
	if (grounded && ((animation_end() && sprite_index == spr_machslideboost3) || (sprite_index == spr_machslideboost3FallStart || sprite_index == spr_machslideboost3Fall)))
	{
		hsp = 0;
		sprite_index = spr_mach3player;
		image_index = 0;
		xscale *= -1;
		movespeed = 12;
		state = 70;
	}
	if (!instance_exists(dashCloudID) && grounded)
	{
		with (instance_create(x, y, 439, 
		{
			playerID: id
		}))
			other.dashCloudID = id;
	}
}
