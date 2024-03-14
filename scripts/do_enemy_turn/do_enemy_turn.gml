function do_enemy_turn()
{
	with(objEnemy)
	{
		show_message("cards_in_hand length = " + string(array_length(deck.cards_in_hand)));
		while current_actions > 0
		{
			switch(choose("attack", "defend", "support"))
			{
				case "attack":
					var _card = deck.cards_in_hand[irandom(array_length(deck.cards_in_hand)-1)];
					//var _attack_cards = array_find_index_all_custom(deck.cards_in_hand, is_attack_card());
					//show_message("_attack_cards length = "+ string(array_length(_attack_cards)));
					do_attack("enemy", _card);
					show_message("finished an attack");
				break;
				case "defend":
				
				break;
				case "support":
				
				break;
			}
		}
	}
}