if !shopOpen exit;

//shop attributes
draw_set_colour(c_black);
	draw_set_alpha(0.5);
		draw_rectangle(0, 0, guiWidth, guiHeight, 0);
	draw_set_alpha(0.8);
		draw_rectangle(menuMargin, 0, menuMargin + menuWidth, guiHeight, 0);
draw_set_alpha(1);
draw_set_colour(c_white);

//draw menu items
for (var i = 0; i < itemCount; i++) {
	//get item
	var _arr = items[| i];
	var _item = _arr[0];
	
	//set position
	var _x = menuMargin + (menuWidth / 2);
	var _y = (guiHeight / 2) + (i - selected) * 32;
	
	//set scale
	var _s = 1;
	if i == selected {
		_item = "> " + _item + " <";
	}
	
	//draw item
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(_x, _y, _item, _s, _s, 0);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

//get preview data
var _arr = items[| selected];
var _item = _arr[0];
var _price = _arr[1];
var _desc = _arr[2];

//set position
var _x = menuMargin + menuWidth + (previewWidth / 2);
var _y = guiHeight / 2;

//draw preview sprite
var _spr = asset_get_index("spr_" + _item);

if sprite_exists(_spr) {
	var _s = 2;
	draw_sprite_ext(_spr, 0, _x, _y, _s, _s, 0, -1, 1);
}

draw_set_colour(c_black);
draw_set_valign(fa_bottom);
draw_text(menuMargin + menuWidth + 4, guiHeight / 14, "Money: $" + string(global.money));

//draw description
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_x, _y + 80, _desc);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//draw price
draw_set_valign(fa_bottom);
draw_text(menuMargin + menuWidth + 4, guiHeight - 4, "Price: $" + string(_price));
draw_set_halign(fa_right);
draw_text(guiWidth - 4, guiHeight - 4, "Press Enter to purchase " + string(_item));
draw_set_valign(fa_top);