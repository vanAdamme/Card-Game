function enemy_choose_actions()
{
	with(obj_enemy)
	{
		repeat(actions_per_turn)
		{
		//also make it so we're not shoving all the scripts in the choose function
		ds_queue_enqueue(enemy_actions, choose({ scr: strike, args: [5, 2] }, { scr: defend, args: [5, 2] }));
		}
	}
}