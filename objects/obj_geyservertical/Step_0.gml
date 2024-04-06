if (!place_meeting(x, y, obj_geyserstop) && geysertimer > 0)
{
	image_yscale -= 1;
	alarm[0] = 150;
}
with (instance_place(x, y, obj_player))
{
	if (state != 109 && state != 99 && other.geysertimer > 0)
	{
		state = 109;
		vsp = -8;
		movespeed = 8;
	}
}
if (geyserGoDown == 1)
	geysertimer = approach(geysertimer, 0, 1);
if (geysertimer <= 0)
{
	image_alpha -= 0.05;
	if (image_yscale < 0)
		image_yscale += 0.5;
}
if (image_alpha <= 0)
	instance_destroy();
