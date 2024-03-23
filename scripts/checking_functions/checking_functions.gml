function is_active_card()
{
	return global.active_card == id;
}

function card_on_top()
{
	var _check_depth = depth;
	with (obj_card_parent)
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
	return sprite_index == data.face;
}

function check_deck()
{
	with (obj_player.deck)
	{
		if array_length(deal_pile) + array_length(discard_pile) + array_length(dealt_cards) != array_length(cards)
		{
			var _text = "deal: " + string(array_length(deal_pile)) + "\ndiscard: " + string(array_length(discard_pile)) + "\nhand: " + string(array_length(dealt_cards)) + "\ncards: " + string(array_length(cards));
			show_message(_text);
		}
	}
}