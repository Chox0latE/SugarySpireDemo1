selected = 0;
selected2 = 0;
depth = -100;
image_speed = 0.35;
pgnum = 1;
rows = 5;
columns = 5;
startx = 58;
starty = 63;
texty = 0;
spacingx = 61;
spacingy = 61;
scrolling = 0;
scrolldelay = 210;
descSurface = -4;
ini_open("saveData.ini");
var slime_kills = ini_read_string("Kills", "obj_gumslime", 0);
var knight_kills = ini_read_string("Kills", "obj_knight", 0);
var juice_kills = ini_read_string("Kills", "obj_googlyjuice", 0);
var cherry_kills = ini_read_string("Kills", "obj_charcherry", 0);
var bear_kills = ini_read_string("Kills", "obj_babybear", 0);
var witch_kills = ini_read_string("Kills", "obj_cottonwitch", 0);
var fish_kills = ini_read_string("Kills", "obj_swedishfish", 0);
var sluggy_kills = ini_read_string("Kills", "obj_sluggy", 0);
var nanner_kills = ini_read_string("Kills", "obj_charger", 0);
var mint_kills = ini_read_string("Kills", "obj_eskimo", 0);
var grog_kills = ini_read_string("Kills", "obj_fizz", 0);
var thief_kills = ini_read_string("Kills", "obj_creamtheifOLD", 0);
var melon_kills = ini_read_string("Kills", "obj_melon", 0);
var cornbig_kills = ini_read_string("Kills", "obj_popcornbag", 0);
var cornsmall_kills = ini_read_string("Kills", "obj_minipopcorn", 0);
var sour_kills = ini_read_string("Kills", "obj_sourbuddy", 0);
var froth_kills = ini_read_string("Kills", "obj_froth", 0);
var bigcherry_kills = ini_read_string("Kills", "obj_bigcherry", 0);
ini_close();
var i = 0;
entry[i++] = [1274, 933, "Pizzelle", "No description set yet.", 1, ["Beat the Game", "You beat the game!"]];
entry[i++] = [318, 1303, "Gumslime", "No description set yet.", slime_kills >= 20, ["Kill 20 Gumslimes", string(floor(slime_kills)) + " killed"]];
entry[i++] = [1274, 206, "Smore Knight", "No description set yet.", knight_kills >= 10, ["Kill 10 Knights", string(floor(knight_kills)) + " marshmallows toasted"]];
entry[i++] = [1274, 1925, "Googly Juice", "No description set yet.", juice_kills >= 10, ["Kill 10 Juices", string(floor(juice_kills)) + " glasses shattered"]];
entry[i++] = [1274, 628, "Cottonwitch", "No description set yet.", witch_kills >= 10, ["Kill 10 Witches", string(floor(witch_kills)) + " ruined rituals"]];
entry[i++] = [1274, 554, "Swedish Anchovy", "No description set yet.", fish_kills >= 15, ["Kill 10 Swedish People.", string(floor(fish_kills)) + " killed"]];
entry[i++] = [1274, 710, "Banancer", "No description set yet.", nanner_kills >= 10, ["Split 10 Bananas", string(floor(nanner_kills)) + " bananas split"]];
entry[i++] = [1274, 177, "Sluggy", "No description set yet.", sluggy_kills >= 15, ["Kill 10 Slugs", string(floor(sluggy_kills)) + " killed"]];
entry[i++] = [1274, 1408, "Eskimint", "No description set yet.", mint_kills >= 15, ["Kill 10 Mints", string(floor(mint_kills)) + " mints losing flavor"]];
entry[i++] = [1274, 377, "Groggulus", "No description set yet. (this guys fuckin useles.. we need to make him better)", grog_kills >= 20, ["Kill 10", string(floor(grog_kills)) + " wrong forecasts"]];
entry[i++] = [1274, 1339, "Groggulus", "No description set yet. (whoever made this guy... spell THIEF right.. stutid ass)", thief_kills >= 10, ["Kill 10", "Stole " + string(floor(grog_kills)) + " keys back"]];
entry[i++] = [1274, 1336, "Meloncool", "No description set yet.", melon_kills >= 15, ["Style on 15", string(floor(melon_kills)) + " styled on"]];
entry[i++] = [1274, 815, "Popcorn", "No description set yet.", cornbig_kills >= 5, ["Butter 5", string(floor(cornbig_kills)) + " bags eaten\n" + string(floor(cornsmall_kills)) + " buttered"]];
entry[i++] = [1274, 1327, "Sour Buddies!!!", "No description set yet.", sour_kills >= 35, ["Kill 35", string(floor(sour_kills)) + " nuisances shaken off"]];
entry[i++] = [1274, 824, "Froth", "No description set yet.", froth_kills >= 35, ["Kill 5", string(floor(froth_kills)) + " killed"]];
entry[i++] = [1274, 1399, "Big Cherry", "No description set yet.", bigcherry_kills >= 35, ["Kill 5", string(floor(bigcherry_kills)) + " bombs detonated"]];
entry[i++] = [1274, 1847, "Charcherry", "No description set yet.", cherry_kills >= 10, ["Detonate 10 charcherries", string(floor(cherry_kills)) + " blown up"]];
entry[i++] = [1274, 1534, "Minibear", "No description set yet.", bear_kills >= 30, ["Kill 30 minibears", string(floor(bear_kills)) + " ran over"]];
