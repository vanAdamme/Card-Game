function go_to_next_game_state()
{
	global.game_state++;
	if global.game_state >= GAME_STATE.LENGTH { global.game_state = GAME_STATE.PLAYER_START; }
		print("Game state (go to next state): ", global.game_state);
	do_current_turn();
}