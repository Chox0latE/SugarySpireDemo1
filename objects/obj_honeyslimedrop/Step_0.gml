if (sprite_index != spr_honeyslime_jump && sprite_index != spr_honeyslime_fall && sprite_index != spr_honeyslime_form && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 500) && y >= (obj_player.y - 500))) && obj_player.state != 88 && obj_player.state != 97 && obj_player.state != 77 && obj_player.state != 98 && obj_player.state != 112)
	sprite_index = spr_honeyslime_jump;
if (sprite_index == spr_honeyslime_jump && animation_end())
{
	image_index = 0;
	dropping = true;
}
if (dropping == 1)
{
	y += 10;
	accel += 0.1;
	sprite_index = spr_honeyslime_fall;
}
if (place_meeting(x, y, obj_solid) && dropping == 1)
{
	sprite_index = spr_honeyslime_form;
	dropping = false;
}
if (sprite_index == spr_honeyslime_form && animation_end())
{
	instance_destroy();
	instance_create(x, y - 50, obj_honeyslime);
}
