function finish_game(_winner)
{
	if _winner == COMBATANT_TYPE.ENEMY
	{
		show_message("You lose!");
		game_end();
	}
		
	if _winner == COMBATANT_TYPE.PLAYER
	{
		show_message("You win!");
		game_end();
	}		
}