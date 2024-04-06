function scr_savelevelDetails()
{
	if (global.collect >= global.srank)
	{
		if (global.combolost == 0 && global.secretfound > 2 && global.lapcount >= 1 && global.treasure)
			global.rank = "p";
		else
			global.rank = "s";
	}
	else if (global.collect > global.arank)
		global.rank = "a";
	else if (global.collect > global.brank)
		global.rank = "b";
	else if (global.collect > global.crank)
		global.rank = "c";
	else
		global.rank = "d";
	switch (global.rank)
	{
		case "e":
		case "p":
		case "s":
			scr_musicnoloop(44);
			break;
		case "a":
			scr_musicnoloop(182);
			break;
		case "b":
			scr_musicnoloop(3);
			break;
		case "c":
			scr_musicnoloop(216);
			break;
		case "d":
			scr_musicnoloop(1);
			break;
	}
	ini_open("saveData.ini");
	if (ini_read_string("Secret", string(global.levelname), 0) < global.secretfound)
		ini_write_string("Secret", string(global.levelname), global.secretfound);
	if (ini_read_string("Treasure", string(global.levelname), 0) == 0)
		ini_write_string("Treasure", string(global.levelname), global.treasure);
	if (ini_read_string("Highscore", string(global.levelname), 0) < global.collect)
		ini_write_string("Highscore", string(global.levelname), global.collect);
	if (ini_read_string("Laps", string(global.levelname), 0) < global.lapcount)
		ini_write_string("Laps", string(global.levelname), global.lapcount);
	if (ini_read_string("Confecti", string(global.levelname) + "1", 0) == 0)
		ini_write_string("Confecti", string(global.levelname) + "1", global.mallowfollow);
	if (ini_read_string("Confecti", string(global.levelname) + "2", 0) == 0)
		ini_write_string("Confecti", string(global.levelname) + "2", global.chocofollow);
	if (ini_read_string("Confecti", string(global.levelname) + "3", 0) == 0)
		ini_write_string("Confecti", string(global.levelname) + "3", global.crackfollow);
	if (ini_read_string("Confecti", string(global.levelname) + "4", 0) == 0)
		ini_write_string("Confecti", string(global.levelname) + "4", global.wormfollow);
	if (ini_read_string("Confecti", string(global.levelname) + "5", 0) == 0)
		ini_write_string("Confecti", string(global.levelname) + "5", global.candyfollow);
	if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", string(global.levelname), "none")))
		ini_write_string("Ranks", string(global.levelname), global.rank);
	ini_close();
}
function confecti_count_level()
{
	var cnt = 0;
	ini_open("saveData.ini");
	for (var i = 1; i <= 5; i++)
	{
		var _c = string(argument0) + string(i);
		if (ini_read_string("Confecti", _c, 0) == 1)
			cnt++;
	}
	ini_close();
	return cnt;
}
