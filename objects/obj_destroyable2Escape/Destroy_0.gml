if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (2)
	{
		instance_create(x + 16, y + 16, obj_debris2);
		with (instance_create(x + 16, y + 16, obj_debris2))
			sprite_index = spr_smallbreak2Escape_Debris;
		with (instance_create(x + 16, y + 16, obj_debris2))
			sprite_index = spr_smallbreak2Escape_Debris;
	}
	instance_create(x, y, obj_collect);
	audio_stop_sound(sound_destroyblock1);
	audio_stop_sound(sound_destroyblock2);
	scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	ds_list_add(global.saveroom, id);
}
