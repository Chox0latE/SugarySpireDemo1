flags.do_once_per_save = true;
output = function()
{
	global.panic = true;
	global.fill = time_in_frames(0, 30);
	obj_tv.target_fill = global.fill;
	obj_tv.timer_in = 0;
	obj_tv.timer_y = 80;
	obj_tv.sucroseTimer = true;
	global.wave = 0;
	global.maxwave = global.fill;
	instance_create(x, y, obj_panicchanger);
};
condition = function()
{
	return audio_sound_get_track_position(global.music) >= 9.45 && obj_music.music == 53;
};
