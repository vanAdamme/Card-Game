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
					var _damage = do_attack("enemy", _card);
show_message("Damage: " + string(_damage));


				break;
				case "defend":
					var _defend = do_defend("enemy", _card);
show_message("Defend: " + string(_defend));
				break;
				case "support":
					var _support = do_support("enemy", _card);
show_message("Support: " + string(_support));
				break;
			}
		}
	}
	fsm.change(");
}