var _inst = instance_position(mouse_x, mouse_y, all);

if obj_game_controller.fsm.get_current_state() == "wait_for_player_input" {
	if _inst.location == CARD_LOCATION.HAND { 
		global.active_card = _inst;
	} else {
		exit;
	}
}

if mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, obj_card_parent)
{
	global.active_card = noone;
}

if (mouse_check_button_pressed(mb_left))
{
	with (obj_card_parent)
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
			//var _nearest = instance_nearest(x, y, objActiveCardSpot);

			if distance_to_object(obj_active_card_spot) < range
			{
				x = obj_active_card_spot.x;
				y = obj_active_card_spot.y + 10;
			}
		}
	}

	drag_object = noone;
	xrelative = 0;
	yrelative = 0;
}