function Card(_title, _type, _subtype, _front, _back) constructor
{
	title		= _title;
	type		= _type;
	subtype		= _subtype;
	front		= _front;
	back		= _back;

	//static show		= function() {}
	//static discard	= function() {}
}

function PlayerCard(_title, _type, _subtype, _front, _back, _attack_val, _defend_val, _support) : Card(_title, _type, _subtype, _front, _back) constructor
{
	attack_val	= _attack_val;
	defend_val	= _defend_val;
	support		= _support;
}

function Deck() constructor
{
	cards = [];
	cards_in_deal_pile = [];
	cards_in_hand = [];
	cards_in_discard = [];

	static add_to_deck = function(_card)
	{
		array_push(cards, _card);
		_card.depth = CARD_MAX_DEPTH - array_length(cards_in_deal_pile);
	}

	static add_to_deal_pile = function(_card)
	{
		array_push(cards_in_deal_pile, _card);
	}

	static add_to_discard = function(_card)
	{
		array_push(cards_in_discard, _card);
	}

	static discard_card = function(_card)
	{
		var _index = array_get_index(cards_in_hand, _card);
		array_delete(cards_in_hand, _index, 1);
		array_push(cards_in_discard, _card);
		_card.x = objDiscardGoesHere.x + 21;
		_card.y = objDiscardGoesHere.y + 40;
		_card.sprite_index = _card.front;
shift_depth(_card);
//		_card.depth = CARD_MAX_DEPTH - array_length(cards_in_discard);
		_card.clickable = false;
		//do discard animation
	}

	static discard_hand = function()
	{
		while !empty(cards_in_hand)
		{
			var _card = array_last(cards_in_hand);
			_card.x = objDiscardGoesHere.x + 21;
			_card.y = objDiscardGoesHere.y + 40;
			_card.sprite_index = _card.front;
			_card.clickable = false;
			shift_depth(_card);
//			_card.depth = CARD_MAX_DEPTH - array_length(cards_in_discard);
			array_push(cards_in_discard, _card);
			//array_delete(cards_in_hand, 0, 1);
			array_pop(cards_in_hand);
			
			//do discard animation
		}
	}

	static shuffle_deal_pile = function()
	{
		cards_in_deal_pile = array_shuffle(cards_in_deal_pile);
	}

	static deal = function(_hand_size)
	{
		for (var i = 0; i < _hand_size; i++)
		{
			if empty(cards_in_deal_pile)
			{
				var _len = array_length(cards_in_discard);
				array_copy(cards_in_deal_pile, 0, cards_in_discard, 0, _len);
				clear_array(cards_in_discard);
				shuffle_deal_pile();
				for (var j = 0; j < array_length(cards_in_deal_pile); j++)
				{
					var _card = cards_in_deal_pile[j];
					_card.sprite_index = _card.back;
					_card.x = objDeckGoesHere.x + 21;
					_card.y = objDeckGoesHere.y + 40;
				}
			}

			var _card = cards_in_deal_pile[i];

			_card.layer = layer_get_id("Cards");
			_card.depth = CARD_MIN_DEPTH - i;
			_card.x = 339 + i * 256
			_card.y = 680;
			_card.sprite_index = _card.front;
			_card.clickable = true;
			array_push(cards_in_hand, _card);
			//do deal animation
		}
		array_delete(cards_in_deal_pile, 0, _hand_size);
	}
}