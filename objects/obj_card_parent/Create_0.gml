event_inherited();
initialise_card_states();

layer = layer_get_id("Cards");

title = undefined;
description = undefined;

functions		= [];
cost			= 0;
xp_to_level		= 0;
text			= "";
face			= noone;
back			= noone;
current_xp		= 0;
level			= 1;
location		= noone;
disabled		= false;

//mouse handling
mouse_doubleclick_init();  // initializes the timer variable for double-click timing
click_flag = false;

x_target = 0;
y_target = 0;

xp_box_width = 7;
xp_box_height = 15;
xp_box_border = 1;

card_border = 16;

spd = 0.2;