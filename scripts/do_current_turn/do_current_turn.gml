function do_current_turn()
{
	switch (global.game_state)
	{
		case GAME_STATE.PLAYER_START:
			print("Game state: ", global.game_state);
			go_to_next_game_state();
		break;

		case GAME_STATE.PLAYER_DURING:
			print("Game state: ", global.game_state);
			// get player input
		break;

		case GAME_STATE.PLAYER_END:
			print("Game state: ", global.game_state);
			with (objPlayer)
			{
				current_defence = 0;
				current_actions = approach(current_actions, max_actions, action_refresh); 
				deck.discard_hand();
				deck.deal(hand_size);
			}

			go_to_next_game_state();
		break;

		case GAME_STATE.ENEMY_START:
			print("Game state: ", global.game_state);
			//do enemy stuff
			var _damage = objEnemy.damage;

			with (objPlayer)
			{
				_damage = max(0, _damage - current_defence);
				current_hp = approach(current_hp, 0, _damage); 
			}

			go_to_next_game_state();
		break;
		
		case GAME_STATE.ENEMY_DURING:
			go_to_next_game_state();
		break;
		
		case GAME_STATE.ENEMY_END:
			go_to_next_game_state();
		break;
	}
}