draw_self();

//info for displaying description sprite
if isShowingInfo {
	draw_set_alpha(1);

	//Title
	draw_set_font(fnt_futured_18);
	draw_set_colour(c_red);
	draw_text_ext(layer_sequence_get_x(obj_inventory_controller.sequence) + 400, layer_sequence_get_y(obj_inventory_controller.sequence) - 130, parent.title, 20, textWidth + 15);

	//Description
	draw_set_font(fnt_futured_12);
	draw_set_colour(c_black);
	draw_text_ext(layer_sequence_get_x(obj_inventory_controller.sequence) + 375, layer_sequence_get_y(obj_inventory_controller.sequence) - 80, parent.description, 20, textWidth);
}

if isInMenu {
	//Price
	draw_set_colour(c_orange);
	draw_set_font(fnt_futured_12);
	draw_text_ext(obj_inventory_controller.backX + 20, obj_inventory_controller.backY + 370, parent.title + ": " + string(parent.price) + " coin.", font_get_size(fnt_futured_12) * 1.5, sprite_get_width(spr_inventory_front) - 20);
}