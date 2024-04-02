function DeckType(_card_type, _amount) constructor
{
	cards_in_deck = array_create(argument_count);
	
	for (var _i = 0; _i < argument_count; _i++)
	{
		cards_in_deck[_i] = [argument[_i][0], argument[_i][1]];
	}
}

function Deck() constructor
{
	cards			= [];
	deal_pile		= []; // index 0 is top card
	dealt_cards		= [];
	discard_pile	= [];

	static add_to_deck = function(_card)
	{
		array_push(cards, _card);
	}

	static remove_from_deck = function(_card)
	{
		array_delete(cards, array_get_index(cards, _card), 1);
		array_delete(deal_pile, array_get_index(deal_pile, _card), 1);
		array_delete(dealt_cards, array_get_index(dealt_cards, _card), 1);
		array_delete(discard_pile, array_get_index(discard_pile, _card), 1);

		instance_destroy(_card.card_obj);
	}

	static add_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card); //adds to bottom of pile
	}

	static initialise_deal_pile = function()
	{
		array_for_each(cards, move_to_deal_pile);
		deal_pile = array_shuffle(deal_pile);
	}

	static move_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card);
		_card.x_target = obj_deck_spot.x;
		_card.y_target = obj_deck_spot.y + 10;
		_card.fsm.change("moving_to_deal_pile");
		_card.depth = obj_deck_spot.depth - array_length(deal_pile);
	}

	static deal_card = function(_card = array_shift(deal_pile))
	{
		if is_undefined(_card)
		{
			empty_discard();
			_card = array_shift(deal_pile);
		}

		array_push(dealt_cards, _card);
		sort_dealt_cards();
	}

	static deal_hand = function(_hand_size)
	{
		discard_hand();

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

	static discard_card = function(_card)
	{
		var _index = array_get_index(dealt_cards, _card);

		array_delete(dealt_cards, _index, 1);
		array_push(discard_pile, _card);

		_card.x_target = obj_discard_pile.x;
		_card.y_target = obj_discard_pile.y + 10;
		_card.fsm.change("discarding");
		_card.depth = obj_discard_pile.depth - array_length(discard_pile);
	}

	static discard_hand = function()
	{
		while !empty(dealt_cards)
		{
			var _card = array_last(dealt_cards);
			discard_card(_card);
		}
	}

	static empty_discard = function()
	{
		array_for_each(discard_pile, move_to_deal_pile);
		clear_array(discard_pile);
		deal_pile = array_shuffle(deal_pile);
	}

	static sort_dealt_cards = function()
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

	static fill_gaps = function()
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