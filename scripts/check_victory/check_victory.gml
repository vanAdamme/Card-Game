function check_victory()
{
	return obj_enemy_controller.current_hp <= 0 || obj_player_controller.current_hp <= 0;
}