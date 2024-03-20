if (mouse_check_button_pressed(mb_left))
{
	with (objCardParent)
	{
		var xx = bbox_left;
		var yy = bbox_top;

		if (!point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + sprite_width, yy + sprite_height) || !clickable) { continue; }

		if is_active_card()	{ set_active_card(false); }
		else				{ set_active_card(true); }

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
	if global.active_card != noone
	{
		with(global.active_card)
		{
			//snap to nearest card spot
			var _nearest = instance_nearest(x, y, objBackgroundCardSpot);

			if distance_to_object(_nearest) < range
			{
				x = _nearest.x;
				y = _nearest.y + 10;
			}
		}
	}

	drag_object = noone;
	xrelative = 0;
	yrelative = 0;
}