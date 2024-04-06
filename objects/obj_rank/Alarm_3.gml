obj_player.visible = 0;
if (obj_player.character == "P")
{
	if (global.rank == "p")
	{
		setcolors(188, 108, 143, 134, 40, 66);
		sprite_index = spr_rankP;
	}
	if (global.rank == "s")
	{
		setcolors(182, 116, 25, 143, 83, 0);
		sprite_index = spr_rankS;
	}
	if (global.rank == "a")
	{
		setcolors(178, 78, 78, 99, 43, 29);
		sprite_index = spr_rankA;
	}
	if (global.rank == "b")
	{
		setcolors(121, 159, 221, 51, 95, 196);
		sprite_index = spr_rankB;
	}
	if (global.rank == "c")
	{
		setcolors(103, 190, 84, 67, 122, 28);
		sprite_index = spr_rankC;
	}
	if (global.rank == "d")
	{
		setcolors(109, 121, 134, 84, 87, 99);
		sprite_index = spr_rankD;
	}
	if (global.rank == "e")
		sprite_index = spr_rankS;
}
if (obj_player.character == "N")
{
	if (global.rank == "p")
	{
		setcolors(188, 108, 143, 134, 40, 66);
		sprite_index = spr_pizzano_rankP;
	}
	if (global.rank == "s")
	{
		setcolors(182, 116, 25, 143, 83, 0);
		sprite_index = spr_pizzano_rankS;
	}
	if (global.rank == "a")
	{
		setcolors(178, 78, 78, 99, 43, 29);
		sprite_index = spr_pizzano_rankA;
	}
	if (global.rank == "b")
	{
		setcolors(121, 159, 221, 51, 95, 196);
		sprite_index = spr_pizzano_rankB;
	}
	if (global.rank == "c")
	{
		setcolors(103, 190, 84, 67, 122, 28);
		sprite_index = spr_pizzano_rankC;
	}
	if (global.rank == "d")
	{
		setcolors(109, 121, 134, 84, 87, 99);
		sprite_index = spr_pizzano_rankD;
	}
	if (global.rank == "e")
		sprite_index = spr_pizzano_rankS;
}
alarm[7] = 120;
image_speed = 0.45;
switch (dex)
{
	case 5:
		cakedex = 4;
		bgdex = 0;
		break;
	case 4:
		cakedex = 4;
		bgdex = 5;
		break;
	case 3:
		cakedex = 3;
		bgdex = 4;
		break;
	case 2:
		cakedex = 2;
		bgdex = 3;
		break;
	case 1:
		cakedex = 1;
		bgdex = 2;
		break;
	case 0:
		cakedex = 0;
		bgdex = 1;
		break;
}
if (global.rank != "p")
	flash = 1;
alarm[3] = -1;
