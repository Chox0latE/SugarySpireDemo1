var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
depth = -10;
image_speed = 0;
image_index = 0;
var originalDistance = point_distance(cam_x, cam_y, xstart, ystart);
var originalDirection = point_direction(cam_x, cam_y, xstart, ystart);
drawx = lengthdir_x(originalDistance, originalDirection);
drawy = lengthdir_y(originalDistance, originalDirection);
drawxscale = 1;
drawyscale = 1;
biggening = true;
targetx = 128;
targety = 96;
if (choosed == 0)
{
	playerID = obj_player;
	switch (playerID.character)
	{
		default:
			sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
			break;
	}
}
col = irandom_range(1, 5);
