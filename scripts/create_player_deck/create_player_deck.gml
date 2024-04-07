function create_player_deck(_deck_type)
{
	var deck = new Deck();

	for (var _i = 0; _i < array_length(_deck_type.cards_in_deck); _i++)
	{
		var _card_type = _deck_type.cards_in_deck[_i][0];
		var _card_amount = _deck_type.cards_in_deck[_i][1];

		repeat(_card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", obj_player_card,
			{
				data : new Card(_card_type),
			});

			add_to_deck(_inst);
			add_to_deal_pile(_inst);
		}
	}

	deal_pile = array_shuffle(deal_pile);

	return deck;
}