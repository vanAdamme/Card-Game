function add_to_deck(_card)
{
	array_push(obj_deck_controller.cards, _card);
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
		_dump = array_for_each_copy(cards, move_to_deal_pile);
		deal_pile = array_shuffle(deal_pile);
		array_delete(_dump, 0, array_length(_dump) - 1);
	}
}

function move_to_deal_pile(_card)
{
	array_push(obj_deck_controller.deal_pile, _card);
	_card.x_target = obj_deck_spot.x;
	_card.y_target = obj_deck_spot.y + 10;
	_card.fsm.change("moving_to_deal_pile");
}

function deal_card()
{
	with(obj_deck_controller)
	{
		if no_cards_left()
		{
			show_message("no cards left!");
			exit;
		}

		if empty(deal_pile)
		{
			empty_discard();
		}

		var _card = array_shift(deal_pile);
		array_push(hand, _card);
	}

	sort_hand();
}

function deal_hand()
{
	discard_hand();

	var _hand_size = obj_player.hand_size;

	for (var _i = 0; _i < _hand_size; _i++)
	{
		deal_card();
	}
}

function discard_card(_card)
{
	with(obj_deck_controller)
	{
		var _index = array_get_index(hand, _card);

		array_delete(hand, _index, 1);
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
		while !empty(hand)
		{
			var _card = array_last(hand);
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

function sort_hand()
{
	with(obj_deck_controller)
	{
		var _count = array_length(hand);
		var _width = obj_dealt_cards_spot.sprite_width div array_length(hand);

		for (var _i = 0; _i < _count; _i++)
		{
			_card = hand[_i];
			_card.x_target = (_width / 2) + (_width * _i) + obj_dealt_cards_spot.bbox_left;
			_card.y_target = obj_dealt_cards_spot.y + 10;
			_card.depth = obj_dealt_cards_spot.depth - 1 - _i
			_card.fsm.change("dealing");
		}
	}
}

function fill_gaps()
{
	with(obj_deck_controller)
	{
		var count = obj_player.hand_size - array_length(hand);
		if count <= 0 { exit; }
		repeat(count)
		{
			deal_card();
		}
		sort_hand();
	}
}