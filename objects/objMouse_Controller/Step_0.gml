if (mouse_check_button_pressed(mb_left))
{
	with (objCardParent)
	{
		if (!point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height) || !clickable)
			continue;

		if is_active_card() { set_active_card(false); }
		else { set_active_card(true); }

		// New card is above previous card
		if (other.drag_object == noone || other.drag_object.depth > depth)
		{
			other.xrelative = x - mouse_x;
			other.yrelative = y - mouse_y;
			other.drag_object = id;
		}
	}

	if (drag_object != noone) { shift_depth(drag_object); }
}

if (mouse_check_button_released(mb_left))
{
	drag_object = noone;
	xrelative = 0;
	yrelative = 0;
}