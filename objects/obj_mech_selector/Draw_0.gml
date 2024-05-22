//shop attributes
draw_set_font(fnt_futured_18);
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
	var _item = items[i];

	//set position
	var _x = menuMargin + (menuWidth / 2);
	var _y = (guiHeight / 2) + (i - selected) * 32;

	//set scale
	var _s = 1;

	if i == selected {
		var _item_title = "> " + _item.title + " <";
	} else {
		var _item_title = _item.title;
	}

	//draw item
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(_x, _y, _item_title, _s, _s, 0);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}

//get preview data
var _spr = asset_get_index("spr_" + string_delete(object_get_name(items[selected].inv_object), 0, 4));
var _desc = items[selected].description;

//set position
var _x = menuMargin + menuWidth + (previewWidth / 2);
var _y = guiHeight / 2;

//draw preview sprite


if sprite_exists(_spr) {
	var _s = 2;
	draw_sprite_ext(_spr, 0, _x, _y, _s, _s, 0, -1, 1);
}

//draw description
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_x, _y + 80, _desc);
draw_set_halign(fa_left);
draw_set_valign(fa_top);