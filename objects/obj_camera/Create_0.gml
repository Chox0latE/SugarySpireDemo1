n = 0;
maxtime = 0;
global.fill = 4000;
greyscalefade = 0;
SSapplication_surface = -4;
finalApplicationSurface = -4;
Collectshake = 0;
Camera_width = room_width;
Camera_height = room_height;
Camera_xorigin = 0;
Camera_yorigin = 0;
panicshake = 0;
panicshakeacc = 0;
DrawY = 0;
DrawHUD = false;
image_speed = 0.35;
alarm[1] = 60;
alarm[2] = 3;
NextFreeze = false;
global.seconds = 59;
global.minutes = 1;
angle = 0;
angledir = 1;
frame = 0;
global.pizza = 0;
global.pizzameter = 0;
global.pillarhunger = 4000;
global.treat = 0;
global.screenflash = 0;
basement = 0;
shake_mag = 0;
shake_mag_acc = 0;
timestop = 1;
zoom = 0;
chargecamera = 0;
alpha = 1;
global.currentrank = "D";
rankbubblesurface = -4;
oldranklol = "FUCK";
bubblescale = 0;
window_set_size(960, 540);
global.maxwave = 0;
global.wave = 0;
pizzaindex = 0;
heatpal = 0;
collectpal = random_range(0, 7);
frozen = false;
freezetype = 0;
freezeval = 0;
global.hitstunalarm = 0;
global.defaulttime = 70;
global.login = 0;
global.starrmode = 0;
global.switchactivated = 0;
Cam_x = 0;
Cam_y = 0;
cam_angle = 0;
cam_zoom = 1;
cam_langle = 0;
cam_lzoom = 1;
cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);
audio_listener_position(obj_player.x, obj_player.y, 0);
audio_listener_orientation(0, 0, 1000, 0, -1, 0);
audio_falloff_set_model(1);
timer_index = 0;
timer_sprite = spr_timer;
coneball_index = 0;
coneball_sprite = spr_timer_coneball_idle;
timer_out = 180;
timer_in = 180;
timer_y = 100;
painterdex = 0;
pizdex = 0;
