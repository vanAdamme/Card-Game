draw_self();

//just to show name and hp temporarily
	draw_set_font(fnt_futured_18);
	draw_set_colour(c_red);
	var _text = title + ": " + string(current_hp);
	draw_text(x, y, _text);
	
//info for displaying description sprite
if isShowingInfo {
	
}

if isInMenu {
	//Price
	draw_set_colour(c_orange);
	draw_set_font(fnt_futured_12);
	draw_text_ext(CameraX() + 55, CameraY() + 390, title + " costs " + string(price) + " coin.", font_get_size(fnt_futured_12) * 1.5, sprite_get_width(spr_inventory_front) - 20);
}