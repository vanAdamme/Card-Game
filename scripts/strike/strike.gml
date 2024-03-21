function strike(_mean, _sd = 0)
{
	if _sd == 0	{ var _amount  = _mean; }
	else		{ var _amount = round(gauss(_mean, _sd)); }

	harm_player(_amount);
	var text = "Enemy strikes at you for " + string(_amount) + " damage!";
	show_message(text);
}