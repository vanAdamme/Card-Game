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

function Deck(_parent) constructor
{
	parent = _parent;
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
			_card.sprite_index = _card.front;
			shift_depth(_card);

			if parent == PARENT_TYPE.PLAYER
			{
				_card.x = map_value(array_length(cards_in_hand) - 1, 0, objPlayer.hand_size - 1, objBackgroundCardSpot.bbox_left, objBackgroundCardSpot.bbox_right);
				_card.y = 710;
				//_card.x = objRoom_Controller.player_card_spot_array[i].x;
				//_card.y = objRoom_Controller.player_card_spot_array[i].y;
				_card.clickable = true;

				//do deal animation
			}

			if parent == PARENT_TYPE.ENEMY
			{
				_card.x = objRoom_Controller.enemy_card_spot_array[i].x;
				_card.y = objRoom_Controller.enemy_card_spot_array[i].y;
				//do deal animation
			}
		}
	}

	static add_to_deal_pile = function(_card)
	{
		array_push(deal_pile, _card);
		_card.sprite_index = _card.back;
		shift_depth(_card);

		if parent == PARENT_TYPE.PLAYER
		{
			_card.clickable = false;
			_card.x = objRoom_Controller.player_deck_spot.x;
			_card.y = objRoom_Controller.player_deck_spot.y;

		}

		if parent == PARENT_TYPE.ENEMY
		{
			_card.x = objRoom_Controller.enemy_deck_spot.x;
			_card.y = objRoom_Controller.enemy_deck_spot.y;
		}
	}
	
	static discard_card = function(_card)
	{
		var _index = array_get_index(cards_in_hand, _card);

		array_delete(cards_in_hand, _index, 1);
		array_push(discard_pile, _card);

		_card.sprite_index = _card.front;

		if parent == PARENT_TYPE.PLAYER
		{
			_card.clickable = false;
			_card.discarding = true;
		}
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