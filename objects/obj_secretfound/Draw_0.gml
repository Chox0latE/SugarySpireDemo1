draw_set_color(c_white);
for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
	var b = ds_list_find_value(collectiblelist, i);
	draw_sprite_ext(b.sprite_index, b.image_index, b.x, b.y, 1, 1, 0, c_white, b.image_alpha);
	if (b.candysona)
		draw_sprite_ext(spr_candysona_platform, b.image_index / 3, b.x, b.y + 49, 1, 1, 0, c_white, b.image_alpha);
}
