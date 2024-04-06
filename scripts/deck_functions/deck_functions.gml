function add_to_deck(_card)
{
	with(obj_deck_controller)
	{
		array_push(cards, _card);
	}
}

function remove_from_deck(_card)
{
	with(obj_deck_controller)
	{
		array_delete(cards, array_get_index(cards, _card), 1);
		array_delete(deal_pile, array_get_index(deal_pile, _card), 1);
		array_delete(dealt_cards, array_get_index(dealt_cards, _card), 1);
		array_delete(discard_pile, array_get_index(discard_pile, _card), 1);
	}

	instance_destroy(_card);
}

function add_to_deal_pile(_card)
{
	with(obj_deck_controller)
	{
		array_push(deal_pile, _card); //adds to bottom of pile
	}
}

function initialise_deck()
{
	with(obj_deck_controller)
	{
		array_for_each(cards, move_to_deal_pile);
		deal_pile = array_shuffle(deal_pile);
	}
}

function move_to_deal_pile(_card)
{
	with(obj_deck_controller)
	{
		array_push(deal_pile, _card);
		_card.x_target = obj_deck_spot.x;
		_card.y_target = obj_deck_spot.y + 10;
		_card.fsm.change("moving_to_deal_pile");
		_card.depth = obj_deck_spot.depth - array_length(deal_pile);
	}
}

function deal_card(_card = array_shift(deal_pile))
{
	with(obj_deck_controller)
	{
		if is_undefined(_card)
		{
			empty_discard();
			_card = array_shift(deal_pile);
		}

		array_push(dealt_cards, _card);
		sort_dealt_cards();
	}
}

function deal_hand()
{
	with(obj_deck_controller)
	{
		discard_hand();
		var _hand_size = obj_player._hand_size;

		var _width = obj_dealt_cards_spot.sprite_width div _hand_size;

		for (var _i = 0; _i < _hand_size; _i++)
		{
			if empty(deal_pile)
			{
				empty_discard();
			}

			var _card = array_pop(deal_pile);
			array_push(dealt_cards, _card);

			_card.x_target = (_width / 2) + (_width * _i) + obj_dealt_cards_spot.bbox_left;
			_card.y_target = obj_dealt_cards_spot.y + 10;
			_card.fsm.change("dealing");
		}
	}
}

function discard_card(_card)
{
	with(obj_deck_controller)
	{
		var _index = array_get_index(dealt_cards, _card);

		array_delete(dealt_cards, _index, 1);
		array_push(discard_pile, _card);

		_card.x_target = obj_discard_pile.x;
		_card.y_target = obj_discard_pile.y + 10;
		_card.fsm.change("discarding");
		_card.depth = obj_discard_pile.depth - array_length(discard_pile);
	}
}

function discard_hand()
{
	with(obj_deck_controller)
	{
		while !empty(dealt_cards)
		{
			var _card = array_last(dealt_cards);
			discard_card(_card);
		}
	}
}

function empty_discard()
{
	with(obj_deck_controller)
	{
		array_for_each(discard_pile, move_to_deal_pile);
		clear_array(discard_pile);
		deal_pile = array_shuffle(deal_pile);
	}
}

function sort_dealt_cards()
{
	with(obj_deck_controller)
	{
		var _count = array_length(dealt_cards);
		var _width = obj_dealt_cards_spot.sprite_width div array_length(dealt_cards);

		for (var _i = 0; _i < _count; _i++)
		{
			_card = dealt_cards[_i];
			_card.x_target = (_width / 2) + (_width * _i) + obj_dealt_cards_spot.bbox_left;
			_card.y_target = obj_dealt_cards_spot.y + 10;
			_card.fsm.change("dealing");
		}
	}
}

function fill_gaps()
{
	with(obj_deck_controller)
	{
		var count = obj_player.hand_size - array_length(dealt_cards);
		if count <= 0 { exit; }
		repeat(count)
		{
			deal_card();
		}
		sort_dealt_cards();
	}
}