function do_support(_mean, _sd)
{
	with (obj_player_controller)
	{
		support = round(gauss(_mean, _sd));

		//heal amount is capped by max_hp
		support = clamp(support, 0, max_hp - current_hp);  
		current_hp += support;
	}
}