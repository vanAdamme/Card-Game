function strike(_mean, _sd = 0)
{
	if _sd == 0	{ amount  = _mean; }
	else		{ amount = round(gauss(_mean, _sd)); }

	harm_player(amount);
	var _text = "Enemy strikes at you for " + string(amount) + " damage!";
	show_message(_text);
}