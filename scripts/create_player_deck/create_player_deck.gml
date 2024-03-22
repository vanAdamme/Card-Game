function create_player_deck(_deck_type)
{
	var _deck = new _deck();

	for (var _i = 0; _i < array_length(_deck_type.cards_in_deck); _i++)
	{
		var _card_amount = _deck_type.cards_in_deck[_i][1];
		var _card_type = _deck_type.cards_in_deck[_i][0];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card,
			{
				values : new TestCard(_card_type),
			});

			_deck.add_to_deck(_inst);
			_deck.add_to_deal_pile(_inst);
		}		
	}
	_deck.deal_pile = array_shuffle(_deck.deal_pile);

	return _deck;
}