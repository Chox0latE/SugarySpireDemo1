var _player = instance_nearest(x, y, obj_player);
if (grabbedPlayer <= -4)
{
	if (distance_to_object(_player) < 100)
	{
		var _player_dir = point_direction(xstart, ystart, _player.x, _player.y);
		targetX = lengthdir_x(90, _player_dir);
		targetY = lengthdir_y(90, _player_dir);
		hsp = 0;
		vsp = 0;
		if (isReady)
		{
			x = round(xstart + targetX);
			y = round(max(ystart + targetY, ystart));
		}
		else
		{
			x = round(lerp(x, xstart + targetX, 0.2));
			y = round(lerp(y, ystart + targetY, 0.2));
			if (x == round(xstart + targetX) && y == round(ystart + targetY))
				isReady = true;
		}
	}
	else
	{
		isReady = false;
		x = round(lerp(x, xstart, 0.2));
		y = round(lerp(y, ystart + 70, 0.2));
	}
}
if (place_meeting(x, y, _player) && !scr_solid(x, y) && _player.vsp >= -3 && _player.state != states.fling && grabbedPlayer <= -4 && waitTimer <= 0)
{
	grabbedPlayer = _player;
	old_hsp = grabbedPlayer.hsp / 4;
	hsp = old_hsp;
	vsp = clamp((grabbedPlayer.vsp / 2) + 10, 5, 20);
	max_vsp = -15;
	with (grabbedPlayer)
	{
		if (!instance_exists(obj_candifiedeffect1))
		{
			instance_create(x, y, obj_candifiedeffect1);
			scr_sound(sfx_bloop);
		}
		state = states.fling;
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
	}
}
if (grabbedPlayer != -4)
{
	with (grabbedPlayer)
	{
		x = other.x;
		y = other.y;
		if (sprite_index != spr_player_candyidle)
			sprite_index = spr_player_candybegin;
		state = states.fling;
		if (!instance_exists(obj_candifiedeffect2))
			instance_create(x, y, obj_candifiedeffect2);
		move = key_left + key_right;
		hsp = move * movespeed;
		if (move != 0 && !scr_solid(x + move, y))
		{
			xscale = move;
			if (movespeed < 6)
				movespeed += 0.25;
		}
		else
			movespeed = 0;
	}
	old_hsp = approach(old_hsp, 0, 0.2);
	hsp = old_hsp + grabbedPlayer.hsp;
	if (scr_solid(x + sign(hsp), y))
	{
		old_hsp = -sign(hsp) * 3;
		grabbedPlayer.movespeed /= 2;
	}
	if (scr_solid(x, y + 1) && vsp >= 0)
		vsp -= 5;
	if (vsp >= 0)
		vsp -= 0.65;
	else if (vsp < 15)
		vsp -= 1;
	x = clamp(x, xstart - 280, xstart + 280);
	if ((x >= (xstart + 200) || x <= (xstart - 200)) || ((xprevious - x) == 0 && (yprevious - y) == 0))
		farBuffer++;
	else
		farBuffer = 0;
	if (grabbedPlayer.y <= ystart && vsp < 0)
	{
		with (grabbedPlayer)
		{
			scr_sound(sfx_bloop2);
			state = states.jump;
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = other.max_vsp;
			sprite_index = spr_player_candytransitionup;
			if (sign(hsp) != 0)
				xscale = sign(hsp);
		}
		grabbedPlayer = -4;
		waitTimer = 25;
	}
	if (obj_player.key_jump || farBuffer >= 100)
	{
		with (grabbedPlayer)
		{
			scr_sound(sfx_bloop2);
			state = states.jump;
			jumpstop = true;
			hsp = other.hsp;
			movespeed = abs(hsp);
			vsp = -6;
			sprite_index = spr_player_candytransitionup;
			if (sign(hsp) != 0)
				xscale = sign(hsp);
		}
		grabbedPlayer = -4;
		waitTimer = 25;
	}
}
if (waitTimer > 0)
	waitTimer--;
candyindex += 0.35;
