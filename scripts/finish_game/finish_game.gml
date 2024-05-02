function finish_game()
{
	if obj_player_controller.current_hp <= 0
	{
		show_message("You lose!");
		game_end();
	}
	else if obj_enemy_controller.current_hp <= 0
	{
		show_message("You win!");
		game_end();
	}
	else
	{
		show_message("How did you get here?");
	}
}