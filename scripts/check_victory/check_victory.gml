function check_victory()
{
	return obj_enemy.current_hp <= 0 || obj_player.current_hp <= 0;
}