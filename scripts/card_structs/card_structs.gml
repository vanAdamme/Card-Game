//if we only have player cards then we can merge these two structs
function Card(_title, _face, _back) constructor
{
	title		= _title;
	face		= _face;
	back		= _back;
}

function PlayerCard(_title, _face, _back, _attack_val, _defend_val, _support_val, _cost = 1, _xp_to_level/*, _attachment*/) : Card(_title, _face, _back) constructor
{
	attack_val	= _attack_val;
	defend_val	= _defend_val;
	support_val	= _support_val;
	cost		= _cost;
	xp_to_level	= _xp_to_level;
	level		= 1;
	//attachment	= _attachment;
}

function TestCard(card_type) constructor
{
	title			= card_type.title;
	face			= card_type.face;
	back			= card_type.back;
	attack_val_m	= card_type.attack_val[0];
	attack_val_sd	= card_type.attack_val[1];
	defend_val_m	= card_type.defend_val[0];
	defend_val_sd	= card_type.defend_val[1];
	support_val_m	= card_type.support_val[0];
	support_val_sd	= card_type.support_val[1];
	cost			= card_type.cost;
	xp_to_level		= card_type.xp_to_level;
	current_xp		= 0;
	level			= 1
}

function Deck() constructor
{
	cards = [];
	deal_pile = [];
	dealt_cards = [];
	discard_pile = [];

	static add_to_deck = function(_card)
	{
		array_push(cards, _card);
	}

	static add_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card);
		_card.sprite_index = _card.values.back;
		shift_depth(_card);

		_card.clickable = false;
		_card.x = objDeckGoesHere.x;
		_card.y = objDeckGoesHere.y + 10;
	}

	static deal_card = function(_card = array_last(deal_pile))
	{
		if is_undefined(_card)
		{
			empty_discard();
			_card = array_last(deal_pile);
		}

		array_push(dealt_cards, _card);
		array_pop(deal_pile);

		_card.sprite_index = _card.values.face;
		_card.clickable = true;

		sort_dealt_cards();
		//do deal animation		
	}

	static deal_hand = function(_hand_size)
	{
		discard_hand();

		if empty(deal_pile) { empty_discard(); }

		for (var i = 0; i < _hand_size; i++)
		{
			deal_card(array_last(deal_pile));
		}
	}

	static discard_card = function(_card)
	{
		var _index = array_get_index(dealt_cards, _card);

		array_delete(dealt_cards, _index, 1);
		array_push(discard_pile, _card);

		_card.sprite_index = _card.values.face;
		_card.clickable = true;
		_card.x = objDiscardGoesHere.x;
		_card.y = objDiscardGoesHere.y + 10;
		
		//_card.discarding = true;
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
		array_for_each(discard_pile, add_to_deal_pile);
		clear_array(discard_pile);
		shuffle(deal_pile);
	}

	static shuffle = function(_array)
	{
		array_shuffle(_array);
	}

	static sort_dealt_cards = function()
	{
		var _count = array_length(dealt_cards);
		var _width = objBackgroundCardSpot.sprite_width div array_length(dealt_cards);

		for (var i = 0; i < _count; i++)
		{
			_card = dealt_cards[i];
			_card.x = (_width / 2) + (_width * i) + objBackgroundCardSpot.bbox_left;
			_card.y = objBackgroundCardSpot.y + 10;
			shift_depth(_card);
		}
	}

	static fill_gaps = function()
	{
		var count = objPlayer.hand_size - array_length(dealt_cards);
		if count <= 0 { exit; }
		repeat(count)
		{
			deal_card();
		}
		sort_dealt_cards();
	}
/*
	static duplicate_card = function(_card)
	{
		var _new_card = new PlayerCard(_card.title, _card.face, _card.back, _card.attack_val, _card.defend_val, _card.support_val, _card.cost, _card.xp_to_level);
		//do instance create thing here
		//add_to_deck(_new_card);
		//discard(_new_card);		
	}
*/
}

function DeckType(_card_type, _amount) constructor
{
	cards_in_deck = array_create(argument_count / 2);
	
	for (var i = 0; i < argument_count / 2; i++)
	{
		cards_in_deck[i] = [argument[2 * i], argument[2 * i + 1]];
	}
}