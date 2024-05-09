draw_self();

//info for displaying description sprite
if isShowingInfo {
	draw_set_alpha(1);

	//Title
	draw_set_font(fnt_futured_18);
	draw_set_colour(c_red);
	draw_text_ext(CameraMiddleX() + 400, CameraY() + 400, parent.title, 20, textWidth + 15);

	//Description
	draw_set_font(fnt_futured_12);
	draw_set_colour(c_black);
	draw_text_ext(CameraMiddleX() + 400, CameraY() + 450, parent.description, 20, textWidth);
}

if isInMenu {
	//Price
	draw_set_colour(c_orange);

	draw_set_font(fnt_futured_12);
	draw_text_ext(textX, textY, parent.title + ": " + string(parent.price) + " coin.", font_get_size(fnt_futured_12) * 1.5, sprite_get_width(spr_inventory_front) - 20);
}