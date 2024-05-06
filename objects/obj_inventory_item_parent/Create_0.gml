layer = layer_get_id("Inventory");
depth = layer_get_depth("Inventory") - 1;

title = undefined;
description = undefined;

//specific drawing data
type = undefined;
name = undefined;
price = undefined;

isInMenu = false;
isShowingInfo = false;

textWidth = sprite_get_width(spr_description) - 60;
iconScale = 0.4;