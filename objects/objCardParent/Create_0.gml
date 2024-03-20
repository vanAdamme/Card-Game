
//mouse handling
//drag = false;
mouse_doubleclick_init();  // initializes the timer variable for double-click timing

//stats
title = "";
attack_val_m = 0;
attack_val_sd = 0;
defend_val_m = 0;
defend_val_sd = 0;
support_val_m = 0;
support_val_sd = 0;

level = 0;
xp_to_level = 0;
current_xp = 0;

front = noone;
back = noone;

clickable = false;
discarding = false;
dealing = false;
dealt_pos = -1;

range = 25;