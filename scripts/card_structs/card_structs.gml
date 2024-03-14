function Card(_title, _type, _subtype, _front, _back) constructor
{
	title		= _title;
	type		= _type;
	subtype		= _subtype;
	front		= _front;
	back		= _back;
}

function PlayerCard(_title, _type, _subtype, _front, _back, _attack_val, _defend_val, _support_val, _cost = 1/*, _attachment*/) : Card(_title, _type, _subtype, _front, _back) constructor
{
	attack_val	= _attack_val;
	defend_val	= _defend_val;
	support_val	= _support_val;
	cost		= _cost;
	//attachment	= _attachment;
}

function Deck() constructor
{
	cards = [];
	deal_pile = [];
	cards_in_hand = [];
	discard_pile = [];

	static add_to_deck = function(_card)
	{
		array_push(cards, _card);
	}

	static deal = function(_hand_size)
	{
		discard_hand();

		for (var i = 0; i < _hand_size; i++)
		{
			if empty(deal_pile)
			{
				empty_discard();
			}

			var _card = array_last(deal_pile);

			_card.x = objRoom_Controller.card_spot_array[i].x;
			_card.y = objRoom_Controller.card_spot_array[i].y;
			shift_depth(_card);
			_card.sprite_index = _card.front;
			_card.clickable = true;
			array_push(cards_in_hand, _card);
			array_pop(deal_pile);
			//do deal animation	
		}
	}

	static add_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card);
		_card.sprite_index = _card.back;
		_card.clickable = false;
		_card.x = objDeckGoesHere.x;
		_card.y = objDeckGoesHere.y;
		shift_depth(_card);
	}
	
	static discard_card = function(_card)
	{
		var _index = array_get_index(cards_in_hand, _card);

		array_delete(cards_in_hand, _index, 1);
		array_push(discard_pile, _card);
		_card.sprite_index = _card.front;
		_card.clickable = false;
		_card.discarding = true;
	}
	
	static discard_hand = function()
	{
		while !empty(cards_in_hand)
		{
			var _card = array_last(cards_in_hand);
			discard_card(_card);
		}
	}

	static empty_discard = function()
	{
		array_for_each(discard_pile, add_to_deal_pile);
		clear_array(discard_pile);
		array_shuffle(deal_pile);
	}
}

function Enemy_Deck() constructor
{
	cards = [];
	deal_pile = [];
	cards_in_hand = [];
	discard_pile = [];

	static add_to_deck = function(_card)
	{
		array_push(cards, _card);
	}

	static deal = function(_hand_size)
	{
		discard_hand();

		for (var i = 0; i < _hand_size; i++)
		{
			if empty(deal_pile)
			{
				empty_discard();
			}

			var _card = array_last(deal_pile);
			array_push(cards_in_hand, _card);
			array_pop(deal_pile);
		}
	}
	
	static add_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card);
	}

	static discard_card = function(_card)
	{
		var _index = array_get_index(cards_in_hand, _card);

		array_delete(cards_in_hand, _index, 1);
		array_push(discard_pile, _card);
	}

	static discard_hand = function()
	{
		while !empty(cards_in_hand)
		{
			var _card = array_last(cards_in_hand);
			discard_card(_card);
		}
	}

	static empty_discard = function()
	{
		array_for_each(discard_pile, add_to_deal_pile);
		clear_array(discard_pile);
		array_shuffle(deal_pile);
	}
}