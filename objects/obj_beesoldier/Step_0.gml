if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != 14)
	state = 14;
if (state == 6 && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 6 && state != 10)
	birdcreated = 0;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 8)
	depth = 0;
if (state != 6 && state != 10)
	thrown = 0;
if (boundbox == 0 && state != 14)
{
	with (instance_create(x, y, 382, 
	{
		baddieID: other.id
	}))
	{
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		baddieID = other.id;
		other.boundbox = 1;
	}
}
scr_commonenemy();
if (state != 7 && state != 0)
	scr_scareenemy();
if (bombreset > 0)
	bombreset--;
if (ragereset > 0)
	ragereset--;
if (state == 0)
	bombreset = 0;
if (point_in_rectangle(obj_player.x, obj_player.y, x - 300, y - 50, x + 300, y + 50) && obj_player.state != 77 && obj_player.state != 62 && state != 3)
{
	if ((state == 0 || state == 3) && bombreset <= 0)
	{
		if (x != obj_player.x)
			image_xscale = -sign(x - obj_player.x);
		sprite_index = spr_beesoldier_intro;
	}
}
if (state != 0 && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != 88 && obj_player.state != 97 && obj_player.state != 77 && obj_player.state != 98 && obj_player.state != 112)
{
	if (state != 9 && state != 7 && bombreset <= 0 && obj_player.state != 88)
	{
		if (state == 3 || state == 0)
		{
			image_index = 0;
			state = 7;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_throw;
		}
	}
}
movespeed = 4;
