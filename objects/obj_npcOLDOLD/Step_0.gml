if (obj_player.state != 94)
	drawing = 0;
error_shake = min(error_shake + 0.05, 12);
if (obj_player.x > x)
	image_xscale = 1;
else
	image_xscale = -1;
if (vsp < 20)
	vsp += grav;
if (place_meeting(x + floor(hsp), y, obj_null))
{
	x = floor(x);
	while (!place_meeting(x + sign(hsp), y, obj_null))
		x += sign(hsp);
	hsp = 0;
}
x += hsp;
if (place_meeting(x, y + floor(vsp), obj_null))
{
	y = floor(y);
	while (!place_meeting(x, y + sign(vsp), obj_null))
		y += sign(vsp);
	vsp = 0;
}
y += floor(vsp);
