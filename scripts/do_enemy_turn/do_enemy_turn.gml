function do_enemy_turn()
{
	with(objEnemy)
	{
		while current_actions > 0
		{
			var _card = deck.cards_in_hand[irandom(array_length(deck.cards_in_hand)-1)];

			switch(choose("attack", "defend", "support"))
			{
				case "attack":
					do_attack("enemy", _card);
				break;

				case "defend":
					do_defend("enemy", _card);
				break;

				case "support":
					do_support("enemy", _card);
				break;
			}
		}
	}
}