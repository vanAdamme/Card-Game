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
	return sprite_index == face;
}

function check_deck()
{
	with (obj_deck_controller)
	{
		if array_length(deal_pile) + array_length(discard_pile) + array_length(hand) != array_length(cards)
		{
			var _text = "deal: " + string(array_length(deal_pile)) + "\ndiscard: " + string(array_length(discard_pile)) + "\nhand: " + string(array_length(hand)) + "\ncards: " + string(array_length(cards));
			show_message(_text);
		}
	}
}

function no_cards_left()
{
	return (empty(obj_deck_controller.deal_pile) && empty(obj_deck_controller.discard_pile));
}

function in_deal_pile(_card = id)
{
	return _card.location == CARD_LOCATION.DEAL_PILE;
}

function in_hand(_card = id)
{
	return _card.location == CARD_LOCATION.HAND;
}

function in_discard_pile(_card = id)
{
	return _card.location == CARD_LOCATION.DISCARD_PILE;
}