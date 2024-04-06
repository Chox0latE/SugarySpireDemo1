var _state = global.freezeframe ? frozenstate : state;
stuntouch--;
stuntouch = max(0, stuntouch);
if (squashedx == 1)
{
	squashvalx = approach(squashvalx, 0.4, 0.15);
	if (squashvalx >= 0.4)
		squashedx = false;
}
else if (squashedx == 0)
	squashvalx = approach(squashvalx, 0, 0.05);
if (squashedy == 1)
{
	squashvaly = approach(squashvaly, 0.4, 0.15);
	if (squashvaly >= 0.4)
		squashedy = false;
}
else if (squashedy == 0)
	squashvaly = approach(squashvaly, 0, 0.05);
if (state != enemystates.grabbed && state != enemystates.panicWait && state != enemystates.secretWait)
	scr_collide();
if (state == enemystates.grabbed)
{
	vsp = 0;
	hsp = 0;
	grounded = false;
}
if (secretjumped && grounded && invincible)
{
	invincible = false;
	secretjumped = false;
}
