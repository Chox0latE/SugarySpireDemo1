var i = 0;
showcollisionarray[i++] = 367;
showcollisionarray[i++] = 473;
showcollisionarray[i++] = 510;
showcollisionarray[i++] = obj_platformside;
showcollisionarray[i++] = obj_movingplatformtrigger;
showcollisionarray[i++] = obj_pitcollider;
if (object_index == obj_solid || object_index == obj_slope || object_index == obj_platform)
	image_alpha = 0.5;
for (i = 0; i < array_length(showcollisionarray); i++)
{
	if (object_index == showcollisionarray[i])
	{
		visible = global.showcollisions;
		break;
	}
}
global.instancelist = 0;
