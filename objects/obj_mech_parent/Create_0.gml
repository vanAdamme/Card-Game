slot = [];
max_hp = 0;
current_hp = 0;
title = "";

isInMenu = false;
isShowingInfo = false;

textWidth = sprite_get_width(spr_description) - 60;
iconScale = 0.4;

mouse_doubleclick_init();  // initializes the timer variable for double-click timing
click_flag = false;
clickable = true;