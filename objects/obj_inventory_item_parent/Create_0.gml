layer = layer_get_id("Inventory");
depth = layer_get_depth("Inventory") - 1;

//specific drawing data
type = undefined;
title = undefined;
price = undefined;
description = undefined;
parent = undefined;

isInMenu = false;
isShowingInfo = false;

textWidth = sprite_get_width(spr_description) - 60;
iconScale = 0.4;