function create_player_deck(_deck_type)
{
	var deck = new Deck();
	var deck_type = _deck_type;

	for (var i = 0; i < array_length(deck_type.cards_in_deck); i++)
	{
		var card_amount = deck_type.cards_in_deck[i][1];
		var card_type = deck_type.cards_in_deck[i][0];

		repeat(card_amount)
		{
			var _inst = instance_create_layer(0, 0, "Cards", objPlayerCard,
			{
				values : new TestCard(card_type),
			});

			deck.add_to_deck(_inst);
			deck.add_to_deal_pile(_inst);
		}		
	}
	deck.deal_pile = array_shuffle(deck.deal_pile);

	return deck;
}