initialise_card_states();

title			= "";
functions		= [];
cost			= 0;
xp_to_level		= 0;
text			= "";
face			= noone;
back			= noone;
current_xp		= 0;
level			= 1;

//assign_card_values();

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