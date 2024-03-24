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
				data : new TestCard(_card_type),
			});

			deck.add_to_deck(_inst);
			deck.add_to_deal_pile(_inst);
		}
	}

	deck.deal_pile = array_shuffle(deck.deal_pile);

	return deck;
}


/*
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
				data : new TestCard(_card_type),
			});

			deck.add_to_deck(_inst);
			deck.add_to_deal_pile(_inst);
		}		
	}

	deck.deal_pile = array_shuffle(deck.deal_pile);

	return deck;
}