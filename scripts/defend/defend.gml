function defend(_mean, _sd = 0)
{
	with(obj_enemy_controller)
	{
		if _sd == 0	{ amount = _mean; }
		else		{ amount = round(gauss(_mean, _sd)); }

		current_defence = approach(current_defence, max_defence, amount);
	}

	var _text = "Enemy gains " + string(amount) + " armour!";
	show_message(_text);
}