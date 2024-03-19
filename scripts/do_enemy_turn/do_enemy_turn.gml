function do_enemy_turn()
{
	with (objEnemy)
	{
		while !ds_queue_empty(enemy_actions)
		{
			var dat = ds_queue_dequeue(enemy_actions);
			script_execute_ext(dat.scr, dat.args);
		}
	}
}