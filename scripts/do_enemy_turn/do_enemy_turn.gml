function do_enemy_turn()
{
	with (obj_enemy_controller)
	{
		while !ds_queue_empty(enemy_actions)
		{
			var _dat = ds_queue_dequeue(enemy_actions);
			script_execute_ext(_dat.scr, _dat.args);
		}
	}
}