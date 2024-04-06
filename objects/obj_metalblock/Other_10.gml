if (DestroyedBy.object_index == obj_player)
{
	with (DestroyedBy)
	{
		if (state == states.freefall || state == states.freefallland)
		{
			scr_sound(sound_maximumspeedland);
			image_index = 0;
			state = states.freefallland;
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
			if (sprite_index == spr_bodyslamfall)
				sprite_index = spr_bodyslamland;
			else
				sprite_index = spr_player_donutSlam_land;
		}
		else if (state == states.superslam)
		{
			sprite_index = spr_piledriverland;
			scr_sound(sound_maximumspeedland);
			jumpAnim = 1;
			jumpstop = 0;
			image_index = 0;
			with (obj_camera)
			{
				shake_mag = 20;
				shake_mag_acc = 40 / room_speed;
			}
			hsp = 0;
			bounce = 0;
			with (instance_create(x, y + 35, obj_bangeffect))
				xscale = obj_player.xscale;
			instance_create(x, y, obj_landcloud);
			freefallstart = 0;
			with (obj_baddie)
			{
				if (bbox_in_camera(view_camera[0]) && grounded)
				{
					image_index = 0;
					vsp = -7;
					hsp = 0;
				}
			}
			if (instance_exists(baddiegrabbedID))
			{
				with (baddiegrabbedID)
				{
					scr_sound(sound_killingblow);
					instance_create(x, y, obj_slapstar);
					instance_create(x, y, obj_baddiegibs);
					flash = 1;
					global.combotime = 60;
					global.hit += 1;
					alarm[1] = 5;
					thrown = 1;
					x = obj_player.x;
					y = obj_player.y;
					hsp = other.xscale * 10;
					vsp = -10;
					hp = 0;
					thrown = true;
					state = 6;
					if (object_index == obj_painter)
					{
						state = bossstates.hurt;
						movespeed = abs(hsp);
					}
					stunned = 500;
				}
			}
		}
	}
	instance_destroy();
}
else
	instance_destroy();
