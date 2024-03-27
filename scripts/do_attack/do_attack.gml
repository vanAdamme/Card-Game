function do_attack(_mean, _sd)
{
	with (obj_player)
	{
		damage = round(gauss(_mean, _sd));
		harm_enemy(damage);
	}
}