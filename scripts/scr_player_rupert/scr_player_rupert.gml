function state_player_rupertnormal()
{
	doublejumped = false;
	momemtum = false;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	var a = xscale;
	if (move != 0)
	{
		xscale = move;
		if (a != xscale)
			movespeed = 2;
		if (movespeed < 8)
			movespeed += 0.25;
		else if (movespeed >= 8)
			movespeed -= 0.15;
	}
	else
		movespeed = approach(movespeed, 0, 0.6);
	if (grounded && slopeCheck(x, y))
	{
		movespeed = 8;
		xscale = -slopeMomentum_direction();
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
		state = 149;
	}
	if (move == 0)
		sprite_index = spr_player_skateidle;
	else
		sprite_index = spr_player_skateslowwalk;
	if (key_jump && grounded)
	{
		jumpstop = false;
		image_index = 0;
		sprite_index = spr_player_skatejumpstart;
		scr_sound(sound_jump);
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -10;
		movespeed = hsp;
		state = 150;
	}
	if (!grounded)
	{
		sprite_index = spr_player_skatedive;
		movespeed = hsp;
		state = 150;
	}
	image_speed = 0.35;
}
function state_player_rupertslide()
{
	momemtum = false;
	hsp = xscale * movespeed;
	move = key_left + key_right;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (key_jump && grounded)
	{
		vsp = -10;
		instance_create(x, y, obj_highjumpcloud2);
		scr_sound(sound_jump);
		sprite_index = spr_player_skatedoublejumpstart;
		image_index = 0;
	}
	if (key_jump && !grounded && doublejumped == 0)
	{
		jumpstop = true;
		doublejumped = 1;
		vsp = -14;
		image_index = 0;
		sprite_index = spr_player_skatedoublejumpstart;
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.xscale;
		scr_sound(sound_jump);
		state = 150;
		movespeed = hsp;
	}
	if (grounded && movespeed < 14)
		player_slopeMomentum(0.25, 0);
	if ((sprite_index != spr_player_skatedoublejumpstart && sprite_index != spr_player_skatedoublejump) || (grounded && vsp > 0))
		sprite_index = spr_player_skatewalk;
	if (animation_end() && sprite_index == spr_player_skatedoublejumpstart)
	{
		image_index = 0;
		sprite_index = spr_player_skatedoublejump;
	}
	if (!grounded && vsp >= terminalVelocity)
	{
		movespeed = hsp;
		state = 150;
		flash = true;
		momemtum = true;
		sprite_index = spr_player_skatespin;
	}
	if (place_meeting_collision(x + sign(hsp), y, 1) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_chocofrog) && !place_meeting(x + sign(hsp), y, obj_metalblock))
	{
		if (!grounded)
		{
			vsp = 0;
			image_index = 0;
			sprite_index = spr_player_skatewallrun;
			state = 151;
			xscale = sign(hsp);
		}
		else
		{
			scr_sound(sound_bump);
			sprite_index = spr_player_skatefall;
			state = 150;
			vsp = -4;
			xscale = -sign(hsp);
			movespeed = xscale * 5;
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
		}
	}
	image_speed = 0.5;
}
function state_player_rupertjump()
{
	static blue_aft = 0;
	if (sprite_index != spr_player_skatespin && animation_end())
	{
		image_index = 0;
		switch (sprite_index)
		{
			case spr_player_skatejumpstart:
				sprite_index = spr_player_skatejump;
				break;
			case spr_player_skatedoublejumpstart:
				sprite_index = spr_player_skatedoublejump;
				break;
			case spr_player_skatewalljumpstart:
				sprite_index = spr_player_skatewalljump;
				break;
		}
	}
	if (key_jump && !grounded && doublejumped == 0)
	{
		jumpstop = true;
		doublejumped = 1;
		vsp = -14;
		image_index = 0;
		sprite_index = spr_player_skatedoublejumpstart;
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.xscale;
		scr_sound(sound_jump);
	}
	if (vsp >= terminalVelocity || sprite_index == spr_player_skatespin || ((doublejumped || sprite_index == spr_player_skatewalljump || sprite_index == spr_player_skatewalljumpstart) && vsp >= 1))
	{
		jumpstop = true;
		if (sprite_index != spr_player_skatespin)
		{
			flash = true;
			sprite_index = spr_player_skatespin;
		}
		vsp += 0.5;
		vsp = min(vsp, 40);
		if (!instance_exists(groundpoundEffect))
			groundpoundEffect = instance_create(x, y, 472, 
			{
				playerID: id
			});
		if (vsp > 17 && !instance_exists(obj_piledrivereffect))
			instance_create(x, y, obj_piledrivereffect, 
			{
				playerID: id
			});
		blue_aft++;
		if (blue_aft >= 6)
		{
			create_afterimage(1, xscale);
			blue_aft = 0;
		}
		image_speed = clamp(floor(abs(vsp) / 20) * 0.5, 0, 0.5) + 0.4;
	}
	else
		image_speed = 0.35;
	hsp = movespeed;
	move = key_left + key_right;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (move != 0)
		movespeed = approach(movespeed, move * 8, 0.65);
	else
		movespeed = approach(movespeed, 0, 0.65);
	if (place_meeting_collision(x + sign(hsp), y, 1))
	{
		if (key_jump2 && move != 0 && move == sign(hsp))
		{
			vsp = 0;
			image_index = 0;
			sprite_index = spr_player_skatewallrun;
			state = 151;
			xscale = sign(hsp);
		}
		else
			movespeed = 0;
	}
	if (grounded && vsp > 0)
	{
		doublejumped = false;
		if (sprite_index == spr_player_skatespin && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_chocofrog))
		{
			if (slopeCheck(x, y))
			{
				movespeed = 11;
				xscale = -slopeMomentum_direction();
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.xscale;
				state = 149;
			}
			else
			{
				scr_sound(sound_maximumspeedland);
				image_index = 0;
				movespeed = 0;
				state = 151;
				jumpAnim = 1;
				jumpstop = 0;
				with (obj_baddie)
				{
					if (bbox_in_camera(view_camera[0]) && grounded)
					{
						vsp = -7;
						hsp = 0;
					}
				}
				with (obj_camera)
				{
					shake_mag = 10;
					shake_mag_acc = 30 / room_speed;
				}
				combo = 0;
				bounce = 0;
				instance_create(x, y, obj_landcloud);
				freefallstart = 0;
				image_index = 0;
				sprite_index = spr_player_skatecrouch;
				flash = true;
			}
		}
		else if (sprite_index != spr_player_skatespin)
		{
			if (slopeCheck(x, y))
			{
				movespeed = 8;
				xscale = -slopeMomentum_direction();
				with (instance_create(x, y, obj_jumpdust))
					image_xscale = other.xscale;
				state = 149;
			}
			else
			{
				state = 148;
				if (sign(hsp) != 0)
					xscale = sign(hsp);
				movespeed = abs(movespeed);
				hsp = xscale * movespeed;
			}
		}
	}
}
function state_player_rupertstick()
{
	doublejumped = false;
	jumpstop = true;
	momemtum = false;
	hsp = 0;
	vsp = 0;
	if (!place_meeting_collision(x + xscale, y, 1) && sprite_index == spr_player_skatewallrun)
	{
		sprite_index = spr_player_skatefall;
		xscale *= -1;
		movespeed = xscale * 5;
		state = 150;
	}
	if (animation_end())
	{
		if (sprite_index == spr_player_skatewallrun)
		{
			sprite_index = spr_player_skatewalljumpstart;
			image_index = 0;
			xscale *= -1;
			vsp = -13;
			movespeed = xscale * 10;
			state = 150;
		}
		else
		{
			state = 148;
			sprite_index = spr_player_skateidle;
			freefallsmash = 0;
		}
	}
	if (sprite_index == spr_player_skatewallrun)
		image_speed = 0.5;
	else
		image_speed = 0.35;
}
