if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	audio_stop_sound(sound_destroyblock1);
	audio_stop_sound(sound_destroyblock2);
	scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	ds_list_add(global.saveroom, id);
}
