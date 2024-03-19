function defend(_mean, _sd = 0)
{
	with(objEnemy)
	{
		if _sd == 0	{ var _amount = _mean; }
		else		{ var _amount = round(gauss(_mean, _sd)); }

		current_defence = approach(current_defence, max_defence, _amount);
	}
}