function do_defend(_mean, _sd)
{
	with (obj_player_controller)
	{
		defence = round(gauss(_mean, _sd));
		current_defence = Approach(current_defence, max_defence, defence);
	}
}