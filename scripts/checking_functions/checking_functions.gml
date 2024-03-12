function is_active_card()
{
	return array_contains(global.active_cards, id);
}

function card_on_top()
{
	var _check_depth = depth;
	with (objCardParent)
	{
		if position_meeting(mouse_x, mouse_y, id) && depth < _check_depth { return false; }
	}
	return true;
}

function empty(_array)
{
	return array_length(_array) == 0;
}

function face_up()
{
	return sprite_index == front;
}