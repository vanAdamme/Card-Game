function check_victory()
{
	if obj_enemy.current_hp <= 0
	{
		return COMBATANT_TYPE.PLAYER;
	}
	else if obj_player.current_hp <= 0
	{
		return COMBATANT_TYPE.ENEMY;
	}
	else
	{
		return false;
	}
}