function corrode_armour(_mean, _sd)
{
	if _sd == 0	{amount  = _mean; }
	else		{amount = round(gauss(_mean, _sd)); }

	obj_player.defence_loss += amount;

	var _text = "Enemy corrodes your armour by " + string(amount) + "!";
	show_message(_text);
}